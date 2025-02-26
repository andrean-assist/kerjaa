import 'dart:async';
import 'dart:io';
import 'package:image/image.dart' as img;

import 'package:app_settings/app_settings.dart';
import 'package:assist_hadir/app/data/model/attendance/req/req_attendance_model.dart';
import 'package:assist_hadir/app/data/model/navigations/navigation_model.dart';
import 'package:assist_hadir/app/data/model/register_face/req/req_register_face_model.dart';
import 'package:assist_hadir/app/data/model/verifications/face/face_verification_model.dart';
import 'package:assist_hadir/app/data/model/verifications/location/location_verification_model.dart';
import 'package:assist_hadir/app/data/model/verifications/verifications_model.dart';
import 'package:assist_hadir/app/helpers/format_date_time.dart';
import 'package:assist_hadir/app/modules/face_setup/widgets/modals/no_access_camera_modal.dart';
import 'package:assist_hadir/app/helpers/logger_helper.dart';
import 'package:assist_hadir/services/attendance/attendance_services.dart';
import 'package:assist_hadir/services/aws/aws_services.dart';
import 'package:assist_hadir/utils/constants_keys.dart';
import 'package:assist_hadir/utils/mlkit_utils.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import '../../../../services/auth/auth_services.dart';
import '../../../../shared/shared_enum.dart';
import '../../../data/db/face_detection/face_detection_model.dart';
import '../../../routes/app_pages.dart';
import '../../init/controllers/init_controller.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/modal/modals.dart';

class FaceSetupController extends GetxController {
  late final InitController _initC;
  late final AuthServices _authS;
  late final AttendanceServices _attendanceS;
  late final AwsServices _awsS;
  late final StreamSubscription<bool> _streamPermissionResult;

  late PhotoCameraState photoState;
  CaptureRequest? captureRequest;
  // late CameraState cameraState;

  late final FaceDetector _faceDetector;

  String? _userId;
  String? _organizationId;
  String? _attendanceId;
  String? _shift;

  var titleBar = '';
  var readyTitle = '';
  var readyDescription = '';
  var readyBtnText = '';
  var successBtnText = '';
  Function()? readyBtnOnPressed;

  final statusSetup = StatusFaceSetup.init.obs;
  StatusAbsenceSetup? statusAbsenceArgs;
  String? _reason;
  LocationVerificationModel? _locationVerification;

  final faceDetectionC = Rxn<FaceDetectionModel>();

  var isBusy = false;
  var isDoneTakePicture = false;
  String? imageFilePath;

  final isEnabled = true.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    _authS = AuthServices(_initC);
    _attendanceS = AttendanceServices(_initC);
    _awsS = AwsServices();

    _initListen();
    _initFaceDetector();
    _initLocalStorage();
    _initArgs();
  }

  void _initListen() {
    if (GetPlatform.isAndroid) {
      _streamPermissionResult =
          CamerawesomePlugin.listenPermissionResult()!.listen(
        (state) {
          print('stream camera permission = $state');

          // jika permission kamera ditolak maka
          if (state) {
            // Get.back();
          } else {
            isEnabled.value = false;
            _showModalNotGrantedPermission();
          }
        },
      );
    }
  }

  void _initFaceDetector() {
    _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        // enableContours: true,
        enableClassification: true, // Enable classification to detect smiles
        enableLandmarks: true,
        enableTracking: true, // Enable tracking to detect faces
        performanceMode: FaceDetectorMode.accurate,
      ),
    );
  }

  void _initLocalStorage() {
    final storage = _initC.localStorage;
    _userId = storage.read(ConstantsKeys.userId);
    _organizationId = storage.read(ConstantsKeys.organizationId);
    _attendanceId = storage.read(ConstantsKeys.attendanceId);

    print('userId = $_userId');
    print('organizationId = $_organizationId');
    print('attendanceId = $_attendanceId');
  }

  void _initArgs() {
    final navModel = Get.arguments as NavigationModel?;
    statusAbsenceArgs = navModel?.absenceType;
    _reason = navModel?.reason;
    _shift = navModel?.shift;
    _locationVerification = navModel?.location;

    if (statusAbsenceArgs != null) {
      switch (statusAbsenceArgs) {
        case StatusAbsenceSetup.register:
          _prepareRegister();
          break;
        case StatusAbsenceSetup.checkIn:
          _prepareCheckIn();
          break;
        case StatusAbsenceSetup.restStop:
          _prepareRest();
          break;
        case StatusAbsenceSetup.checkOut:
          _prepareCheckOut();
          break;
        default:
      }
    }
  }

  Future<void> initRegister() async {
    statusSetup.value = StatusFaceSetup.prepare;
    await Future.delayed(3.seconds);
    statusSetup.value = StatusFaceSetup.ready;
  }

  void _prepareRegister() {
    titleBar = 'Daftarkan wajah';
    readyBtnText = 'Ambil Gambar';
    readyBtnOnPressed = takePicture;
    successBtnText = 'Mulai absen sekarang';
  }

  void _prepareCheckIn() {
    titleBar = 'Check in';
    successBtnText = 'Kembali ke home';
    readyDescription = 'checkin';
    statusSetup.value = StatusFaceSetup.ready;
  }

  void _prepareRest() {
    titleBar = 'Verifikasi wajah';
    successBtnText = 'Kembali ke home';
    readyDescription = 'verifikasi wajah';
    statusSetup.value = StatusFaceSetup.ready;
  }

  void _prepareCheckOut() {
    titleBar = 'Check out';
    successBtnText = 'Kembali ke home';
    readyDescription = 'checkout';
    statusSetup.value = StatusFaceSetup.ready;
  }

  Future<void> takePicture() async {
    print('tombol ambil gambar ditekan');

    try {
      captureRequest = await photoState.takePhoto(
        onPhoto: (singleRequest) async {
          print('singleRequest = ${singleRequest.path}');
          isDoneTakePicture = true;
          imageFilePath = singleRequest.path;
        },
        onPhotoFailed: (exception) => _initC.logger.e('Error: $exception'),
      );
      statusSetup.value = StatusFaceSetup.success;
    } catch (e) {
      _initC.logger.e('Error: $e');
    } finally {
      isBusy = false;
    }
  }

  Future<File> setImageOrientationToPortrait(File imageFile) async {
    try {
      final image = img.decodeJpg(await imageFile.readAsBytes());

      if (image != null) {
        final orientedImage = img.copyRotate(image, angle: 0);
        await imageFile.writeAsBytes(img.encodeJpg(orientedImage));
      }
    } catch (e) {
      _initC.logger.e('Error: setImageOrientationToPortrait = $e');
    }

    return imageFile;
  }

  Future analyzeImage(AnalysisImage img, Size viewportSize) async {
    final inputImage = img.toInputImage();

    try {
      final faces = await _faceDetector.processImage(inputImage);

      if (faces.isNotEmpty) {
        // print('muka terdeteksi = ${faces.length}');

        if (faces.length == 1) {
          isEnabled.value = true;

          // final boundingBox = faces.first.boundingBox; // Area wajah
          // final left = boundingBox.left;
          // final right = boundingBox.right;
          // final top = boundingBox.top;
          // final bottom = boundingBox.bottom;

          // print('FaceSetupController: viewportSize = $viewportSize');
          // print('FaceSetupController: boundingBox = $boundingBox');
          // print('FaceSetupController: left = $left');
          // print('FaceSetupController: right = $right');
          // print('FaceSetupController: top = $top');
          // print('FaceSetupController: bottom = $bottom');

          // if (left >= 0 &&
          //     top >= 0 &&
          //     right <= viewportSize.width &&
          //     bottom <= viewportSize.height) {
          //   print('FaceSetupController: Wajah terlihat sepenuhnya');
          //   if (statusAbsenceArgs != StatusAbsenceSetup.register) {
          //     print('FaceSetupController: isBusy = $isBusy');
          //     print(
          //         'FaceSetupController: isDoneTakePicture = $isDoneTakePicture');

          // if (!isBusy && !isDoneTakePicture) {
          //   isBusy = true;
          //   print('FaceSetupController: takePicture');
          //   await takePicture();
          //   isBusy = false;

          // save datetime checkin
          // _initC.setTimeStorage(ConstantsKeys.startTimeWork);
          // }
          //   }
          // } else {
          //   print('FaceSetupController: Wajah tidak terlihat sepenuhnya');
          // }

          if (faces.first.trackingId != null) {
            final smilingProbability = faces.first.smilingProbability;

            print('smillingProbability = $smilingProbability');

            if (smilingProbability != null) {
              if (smilingProbability > 0.7) {
                if (statusAbsenceArgs != StatusAbsenceSetup.register) {
                  if (!isBusy && !isDoneTakePicture) {
                    isBusy = true;
                    print('FaceSetupController: takePicture');
                    await takePicture();
                    isBusy = false;
                  }
                }

                print(
                    "Wajah sedang tersenyum (Probabilitas: $smilingProbability)");
              } else {
                print(
                    "Wajah tidak tersenyum (Probabilitas: $smilingProbability)");
              }
            }
          }

          faceDetectionC.value = FaceDetectionModel(
            faces: faces,
            absoluteImageSize: inputImage.metadata!.size,
            imageRotation: img.inputImageRotation,
            img: img,
          );
        } else {
          isEnabled.value = false;
        }

        // for (var face in faces) {
        //   final headEulerAngleY =
        //       face.headEulerAngleY; // Rotasi vertikal (y-axis)
        //   final headEulerAngleZ =
        //       face.headEulerAngleZ; // Rotasi horizontal (z-axis)`

        //   if (headEulerAngleY != null) {
        //     if (headEulerAngleY > 15) {
        //       // print("debug: Kepala memutar ke kanan");
        //       textHint.value = 'Kepala memutar ke kanan';
        //     } else if (headEulerAngleY < -15) {
        //       // print("debug: Kepala memutar ke kiri");
        //       textHint.value = 'Kepala memutar ke kiri';
        //     }
        //   }

        //   if (headEulerAngleZ != null) {
        //     if (headEulerAngleZ > 15) {
        //       // print("Kepala miring ke kanan");
        //       textHint.value = 'Kepala miring ke kanan';
        //     } else if (headEulerAngleZ < -15) {
        //       // print("Kepala miring ke kiri");
        //       textHint.value = 'Kepala miring ke kiri';
        //     }
        //   }

        //   // print(face);
        //   if (face.trackingId != null) {
        //     backgroundColors.value = Colors.red;
        //   }
        // }

        // faceDetectionC.add(
        //   FaceDetectionModel(
        //     faces: faces,
        //     absoluteImageSize: inputImage.metadata!.size,
        //     imageRotation: img.inputImageRotation,
        //     img: img,
        //   ),
        // );
      } else {
        isEnabled.value = false;
        // print('Wajah tidak terdeteksi');
        faceDetectionC.value = null;
      }
    } catch (error) {
      _initC.logger.e("...sending image resulted error $error");
    }
  }

  void action() {
    print('statusAbsenceArgs = $statusAbsenceArgs');

    if (statusAbsenceArgs != null) {
      if (statusAbsenceArgs == StatusAbsenceSetup.register) {
        _actionRegisterFace();
      } else {
        _actionAttendance();
      }
    }
  }

  Future<String?> _uploadImage(File file) async {
    // if (file == null) return null;

    print('path = ${file.path}');

    final res = await _awsS.uploadImage(file.path);

    print('res statusCode = ${res.statusCode}');

    if (res.statusCode == HttpStatus.ok) {
      return res.data;
    }

    return null;
  }

  // register wajah ke api
  Future<void> _actionRegisterFace() async {
    if (captureRequest != null && captureRequest?.path != null) {
      isLoading.value = true;

      final imageFile = File(captureRequest!.path!);
      final file = await setImageOrientationToPortrait(imageFile);
      final urlImage = await _uploadImage(file);

      final reqRegisterFace = ReqRegisterFaceModel(
        avatar: urlImage,
        isVerified: true,
      );

      try {
        final res = await _authS.registerFace(reqRegisterFace.toJson());

        if (res.isOk) {
          final body = res.body;

          if (body != null) {
            _initC.localStorage.write(ConstantsKeys.isVerified, true);
            _initC.localStorage.write(ConstantsKeys.profilPicture, urlImage);
            _moveToMain();
          }
        } else {
          _initC.handleError(status: res.status, onLoad: _actionRegisterFace);
        }
      } on GetHttpException catch (e) {
        _initC.logger.e('Error: actionRegisterFace $e');
      } finally {
        isLoading.value = false;
      }
    } else {
      // jika capture request tidak ada coba ambil foto lagi
      _initC.showDialogFailed(onPressed: () {
        takePicture();
        Get.back();
      });
    }
  }

  // absen masuk ke api
  Future<void> _actionAttendance() async {
    if (captureRequest != null && captureRequest?.path != null) {
      isLoading.value = true;

      print('imageFile from variabel = $imageFilePath');
      final imageFile = File(imageFilePath!);
      print('imageFile before set rotation = ${imageFile.path}');
      final file = await setImageOrientationToPortrait(imageFile);
      print('imageFile after set rotation = ${file.path}');

      final urlImage = await _uploadImage(file);

      final now = FormatDateTime.dateToString(
        newPattern: 'yyyy-MM-dd',
        value: DateTime.now().toString(),
      );

      var reqAttendance = ReqAttendanceModel(
        userId: _userId,
        organizationId: _organizationId,
        date: now,
        userReasonLocation: _reason,
        shift: _shift,
        verifications: VerificationsModel(
          faceVerification: FaceVerificationModel(
            faceImagesUrl: urlImage,
            faceVerified: true,
          ),
          locationVerification: _locationVerification,
        ),
      );

      try {
        Response? res;

        switch (statusAbsenceArgs) {
          case StatusAbsenceSetup.checkIn:
            reqAttendance = reqAttendance.copyWith.call(type: 'checkIn');
            res = await _attendanceS.createAttendance(reqAttendance.toJson());
            break;
          case StatusAbsenceSetup.restStop:
            reqAttendance = reqAttendance.copyWith.call(
              type: 'breakStop',
              attendanceId: _attendanceId,
            );
            res = await _attendanceS.updateAttendance(reqAttendance.toJson());
            break;
          case StatusAbsenceSetup.checkOut:
            reqAttendance = reqAttendance.copyWith.call(
              type: 'checkOut',
              attendanceId: _attendanceId,
            );
            res = await _attendanceS.updateAttendance(reqAttendance.toJson());
            break;
          default:
        }

        LoggerHelper.printPrettyJson(reqAttendance.toJson());

        print('res body = ${res?.body}');

        if (res!.isOk) {
          _moveToMain();
        } else {
          _initC.handleError(status: res.status, onLoad: _actionAttendance);
        }
      } on GetHttpException catch (e) {
        _initC.logger.e('Error: _actionAttendance $e');
      } finally {
        isLoading.value = false;
      }
    }
  }

  void _showModalNotGrantedPermission() {
    Modals.bottomSheetWithClose(
      context: Get.context!,
      isDismissible: false,
      content: const NoAccessCameraModal(),
      actions: Buttons.filled(
        width: double.infinity,
        onPressed: () async {
          await AppSettings.openAppSettings();
          await CamerawesomePlugin.refresh();
          Get.back();
        },
        child: const Text('Pergi ke pengaturan'),
      ),
    );
  }

  void _moveToMain() => Get.offAllNamed(Routes.MAIN);

  @override
  void onClose() {
    _faceDetector.close();
    _streamPermissionResult.cancel();
    super.onClose();
  }
}
