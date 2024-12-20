import 'package:assist_hadir/app/helpers/save_helper.dart';
import 'package:assist_hadir/shared/shared_enum.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
// import 'package:camerawesome/src/orchestrator/exceptions/camera_states_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/shared_theme.dart';
import '../../widgets/buttons/buttons.dart';
import '../controllers/face_setup_controller.dart';
import '../widgets/progress/dashed_circle_progress.dart';

class ReadyFaceScreen extends GetView<FaceSetupController> {
  final double circleDiameter;

  const ReadyFaceScreen(this.circleDiameter, {super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _builderCircle(textTheme),
        _builderHint(textTheme),
        _builderButton(),
      ],
    );
  }

  Widget _builderCircle(TextTheme textTheme) {
    print('width = ${circleDiameter * 0.9}');

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            DashedCircleProgress(
              circleDiameter: circleDiameter,
              progress: 0,
            ),
            ClipOval(
              child: SizedBox(
                width: circleDiameter * 0.9,
                height: circleDiameter * 0.9,
                child: CameraAwesomeBuilder.custom(
                  mirrorFrontCamera: true,
                  sensorConfig: SensorConfig.single(
                    sensor: Sensor.position(SensorPosition.front),
                    aspectRatio: CameraAspectRatios.ratio_1_1,
                  ),
                  previewFit: CameraPreviewFit.cover,
                  imageAnalysisConfig: AnalysisConfig(
                    androidOptions: AndroidAnalysisOptions.nv21(
                      width: (circleDiameter * 0.9).toInt(),
                    ),
                    maxFramesPerSecond: 10,
                  ),
                  onImageForAnalysis: controller.analyzeImage,
                  builder: (state, preview) {
                    // controller.cameraState.value = state;
                    state.when(
                      onPhotoMode: (photoState) {
                        controller.photoState = photoState;
                      },
                    );

                    return const SizedBox.shrink();
                  },
                  saveConfig: SaveConfig.photo(
                    pathBuilder: (sensors) async {
                      final imagePath = await SaveHelper.getSavePath(
                        DateTime.now().toIso8601String(),
                      );
                      print('imagePathBuilder = $imagePath');

                      return SingleCaptureRequest(imagePath, sensors.first);
                    },
                    exifPreferences: ExifPreferences(saveGPSLocation: true),
                    mirrorFrontCamera: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _builderHint(TextTheme textTheme) {
    if (controller.statusAbsenceArgs != StatusAbsenceSetup.register) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Verifikasi wajah Anda',
            style: textTheme.titleLarge?.copyWith(
              fontWeight: SharedTheme.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          const Text('Pastikan wajah Anda berada di dalam lingkaran'),
        ],
      );
    }

    return Obx(() {
      return Text(
        controller.textHint.value,
        style: textTheme.titleLarge?.copyWith(
          fontWeight: SharedTheme.bold,
          fontSize: 20,
        ),
      );
    });
  }

  Widget _builderButton() {
    if (controller.readyBtnOnPressed != null) {
      return Obx(
        () => Buttons.filled(
          width: double.infinity,
          state: controller.isLoading.value,
          onPressed: (controller.isEnabled.value)
              ? controller.readyBtnOnPressed
              : null,
          child: Text(controller.readyBtnText),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}

// class FacePainter extends CustomPainter {
//   final FaceDetectionModel? faceDetectionModel;

//   FacePainter({
//     super.repaint,
//     required this.faceDetectionModel,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.green
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 4;

//     if (faceDetectionModel != null) {
//       // canvas.save();

//       for (var face in faceDetectionModel!.faces) {
//         final boundingBox = face.boundingBox;
//         canvas.drawRect(boundingBox, paint);
//       }

//       final face = faceDetectionModel!.faces.first;
//       face.boundingBox;
//     } else {
//       // canvas.restore();
//     }
//   }

//   @override
//   bool shouldRepaint(FacePainter oldDelegate) {
//     return oldDelegate.faceDetectionModel != faceDetectionModel;
//   }
// }
