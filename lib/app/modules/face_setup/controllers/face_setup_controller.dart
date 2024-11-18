import 'package:assist_hadir/app/modules/face_setup/screen/ready_face_screen.dart';
import 'package:camera/camera.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import '../../../../shared/shared_enum.dart';
import '../../init/controllers/init_controller.dart';

class FaceSetupController extends GetxController {
  late final InitController _initC;
  late final CameraController cameraC;

  // late final List<CameraDescription> _cameras;

  final statusSetup = StatusFaceSetup.init.obs;

  final options = FaceDetectorOptions(
    enableContours: true,
    enableClassification: true,
    enableLandmarks: true,
    enableTracking: true,
    performanceMode: FaceDetectorMode.accurate,
  );
  late final faceDetector = FaceDetector(options: options);

  final faceDetectionC = Rxn<FaceDetectionModel>();

  final preview = Rxn<Preview>();

  final backgroundColors = Rxn<Color>();
  final textHint = ''.obs;

  late final MediaCapture mediaCapture;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }
  }

  Future<void> initCamera() async {
    statusSetup.value = StatusFaceSetup.prepare;
    await Future.delayed(3.seconds);
    statusSetup.value = StatusFaceSetup.ready;

    // try {
    //   _cameras = await availableCameras();
    //   cameraC = CameraController(
    //     _cameras[1],
    //     ResolutionPreset.max,
    //     enableAudio: false,
    //   );
    //   await cameraC.initialize();
    //   statusSetup.value = StatusFaceSetup.ready;
    // } on CameraException catch (e) {
    //   _initC.logger.e('Error: $e');
    // }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // cameraC.dispose();
    faceDetector.close();
    super.onClose();
  }

  Future analyzeImage(AnalysisImage img) async {
    final inputImage = img.toInputImage();

    try {
      final faces = await faceDetector.processImage(inputImage);

      if (faces.isNotEmpty) {
        print('type inputImage = ${inputImage.type.name}');

        for (var face in faces) {
          final headEulerAngleY =
              face.headEulerAngleY; // Rotasi vertikal (y-axis)
          final headEulerAngleZ =
              face.headEulerAngleZ; // Rotasi horizontal (z-axis)

          if (headEulerAngleY != null) {
            if (headEulerAngleY > 15) {
              // print("debug: Kepala memutar ke kanan");
              textHint.value = 'Kepala memutar ke kanan';
            } else if (headEulerAngleY < -15) {
              // print("debug: Kepala memutar ke kiri");
              textHint.value = 'Kepala memutar ke kiri';
            }
          }

          if (headEulerAngleZ != null) {
            if (headEulerAngleZ > 15) {
              // print("Kepala miring ke kanan");
              textHint.value = 'Kepala miring ke kanan';
            } else if (headEulerAngleZ < -15) {
              // print("Kepala miring ke kiri");
              textHint.value = 'Kepala miring ke kiri';
            }
          }

          // print(face);
          if (face.trackingId != null) {
            backgroundColors.value = Colors.red;
          }
        }

        faceDetectionC.value = FaceDetectionModel(
          faces: faces,
          absoluteImageSize: inputImage.metadata!.size,
          imageRotation: img.inputImageRotation,
          img: img,
        );

        // faceDetectionC.add(
        //   FaceDetectionModel(
        //     faces: faces,
        //     absoluteImageSize: inputImage.metadata!.size,
        //     imageRotation: img.inputImageRotation,
        //     img: img,
        //   ),
        // );
      } else {
        backgroundColors.value = null;
        faceDetectionC.value = null;
      }

      // debugPrint“("...sending image resulted with : ${faces?.length} faces");
    } catch (error) {
      _initC.logger.e("...sending image resulted error $error");
    }
  }
}
