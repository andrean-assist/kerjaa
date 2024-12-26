import 'dart:async';
import 'dart:io';

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
import 'package:path/path.dart' as p;

import '../../../../services/auth/auth_services.dart';
import '../../../../shared/shared_enum.dart';
import '../../../data/model/face_detection_model.dart';
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
  late CameraState cameraState;

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
  final textHint = ''.obs;

  var isTakePicture = false;

  final isEnabled = true.obs;
  final isLoading = false.obs;

  final fotoFerdie =
      'https://media.licdn.com/dms/image/v2/D5603AQF86Nsp6CfdyQ/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1707224683941?e=2147483647&v=beta&t=aaOwgNrIRERWULTwQq61poG3C921g6pKXRp8CjHQ5qo';

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
    _awsS = AwsServices(_initC);

    _initListen();
    _initFaceDetector();
    _initLocalStorage();
    _initArgs();
  }

  void _initListen() {
    _streamPermissionResult =
        CamerawesomePlugin.listenPermissionResult()!.listen(
      (state) {
        print('stream camera permission = $state');

        // jika permission kamera ditolak maka
        if (state) {
          Get.back();
        } else {
          isEnabled.value = false;
          _showModalNotGrantedPermission();
        }
      },
    );
  }

  void _initFaceDetector() {
    _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        // enableContours: true,
        enableClassification: true,
        // enableLandmarks: true,
        enableTracking: true,
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
    isTakePicture = true;
    print('tombol ambil gambar ditekan');

    try {
      captureRequest = await photoState.takePhoto();
      statusSetup.value = StatusFaceSetup.success;
    } catch (e) {
      _initC.logger.e('Error: $e');
    } finally {
      isTakePicture = false;
    }
  }

  Future analyzeImage(AnalysisImage img) async {
    final inputImage = img.toInputImage();

    try {
      final faces = await _faceDetector.processImage(inputImage);

      if (faces.isNotEmpty) {
        print('muka terdeteksi = ${faces.length}');
        // textHint.value = 'Muka terdeteksi ${faces.length}';

        if (faces.length == 1) {
          isEnabled.value = true;
          // final boundingBox = faces.first.boundingBox; // Area wajah
          // final width = boundingBox.width;
          // final height = boundingBox.height;
          // final center = boundingBox.center;

          // Kriteria sederhana untuk deteksi wajah penuh
          // if (width > 100 && height > 100) {
          //   // Wajah cukup besar
          //   if (center.dx > 50 && center.dy > 50) {
          //     // Berada di tengah
          //     print("Wajah terlihat penuh di kamera");
          //   } else {
          //     print("Wajah tidak berada di tengah kamera");
          //   }
          // } else {
          //   print("Wajah terlalu kecil atau tidak lengkap");
          // }

          if (faces.first.trackingId != null) {
            final smilingProbability = faces.first.smilingProbability;

            print('smillingProbability = $smilingProbability');

            if (smilingProbability != null) {
              if (smilingProbability > 0.5) {
                if (statusAbsenceArgs != StatusAbsenceSetup.register) {
                  if (!isTakePicture) {
                    await takePicture();

                    // save datetime checkin
                    _initC.setTimeStorage(ConstantsKeys.startTimeWork);
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

      // debugPrint“("...sending image resulted with : ${faces?.length} faces");
    } catch (error) {
      _initC.logger.e("...sending image resulted error $error");
    }
  }

  void action() {
    if (statusAbsenceArgs != null) {
      if (statusAbsenceArgs == StatusAbsenceSetup.register) {
        _actionRegisterFace();
      } else {
        _actionAttendance();
      }
    }
  }

  Future<String?> _uploadImage(String? path) async {
    if (path == null) return null;

    final imageFile = File(path);

    final filename = p.basename(path);

    final multipart = MultipartFile(
      File(path),
      filename: filename,
      contentType: ContentType.binary.value,
    );

    final formData = FormData({filename: multipart});
    final res = await _awsS.uploadImage(formData);

    if (res.isOk) {
      final bodyFilename = res.bodyString;
      return bodyFilename;
    }

    return null;
  }

  // register wajah ke api
  Future<void> _actionRegisterFace() async {
    isLoading.value = true;

    if (captureRequest != null) {
      final urlImage = await _uploadImage(captureRequest!.path);

      final reqRegisterFace = ReqRegisterFaceModel(
        avatar: urlImage,
        isVerified: true,
      );

      try {
        final res = await _authS.registerFace(reqRegisterFace.toJson());

        print('res body = ${res.body}');
        print('res statusCode = ${res.statusCode}');

        if (res.isOk) {
          final body = res.body;

          if (body != null) {
            _moveToHome();
          }
        } else {
          if (res.statusCode == 401) {
            _initC.redirectLogout(Get.context!);
          } else {
            _initC.showDialogFailed(
              onPressed: () {
                _actionRegisterFace();
                Get.back();
              },
            );
          }
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
    if (captureRequest != null) {
      isLoading.value = true;

      final urlImage = await _uploadImage(captureRequest!.path);

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
          _moveToHome();
        }
      } on GetHttpException catch (e) {
        _initC.logger.e('Error: _actionAttendance $e');
      } finally {
        isLoading.value = false;
      }
    }
  }

  void _showModalNotGrantedPermission() {
    Modals.bottomSheet(
      context: Get.context!,
      isDismissible: false,
      content: const NoAccessCameraModal(),
      actions: Buttons.filled(
        width: double.infinity,
        onPressed: () async {
          await AppSettings.openAppSettings();
          await CamerawesomePlugin.refresh();

          // final isGrantedPermission =
          //     await CamerawesomePlugin.checkAndRequestPermissions(true);
          // final isGrantedCamera = isGrantedPermission?.firstWhereOrNull(
          //   (element) => element == CamerAwesomePermission.camera,
          // );

          // if (isGrantedCamera != null) {

          // }

          // print(
          //     'isGrantedCamera = index: ${isGrantedCamera?.index}, name: ${isGrantedCamera?.name}');

          // try {
          //   if (GetPlatform.isAndroid) {
          //     // final device = await DeviceInfoPlugin().androidInfo;
          //     // final androidVersion = int.tryParse(device.version.release) ?? 0;

          //     AppSettings.openAppSettings(type: AppSettingsType.settings);
          //     // if (androidVersion >= 10) {
          //     //   AppSettings.openAppSettingsPanel(
          //     //     AppSettingsPanelType.internetConnectivity,
          //     //   );
          //     // } else {
          //     // }
          //     // print('version android = ${device.version.release}');
          //   }

          //   if (GetPlatform.isIOS) {
          //     AppSettings.openAppSettings(type: AppSettingsType.settings);
          //   }
          // } catch (e) {
          //   _initC.logger.e('Error: $e');
          // } finally {
          //   Get.back();
          // }
        },
        child: const Text('Pergi ke pengaturan'),
      ),
    );
  }

  void _moveToHome() => Get.offAllNamed(Routes.HOME);

  @override
  void onClose() {
    _faceDetector.close();
    _streamPermissionResult.cancel();
    super.onClose();
  }
}
