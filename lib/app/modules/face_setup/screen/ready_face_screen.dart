import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../shared/shared_theme.dart';
import '../../widgets/buttons/buttons.dart';
import '../controllers/face_setup_controller.dart';
import '../widgets/progress/dashed_circle_progress.dart';

class ReadyFaceScreen extends StatelessWidget {
  final double circleDiameter;
  final FaceSetupController controller;

  const ReadyFaceScreen(this.circleDiameter, this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _builderCircle(textTheme, circleDiameter),
        _builderHint(textTheme),
        _builderButton(),
      ],
    );
  }

  Widget _builderCircle(TextTheme textTheme, double circleDiameter) {
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
                  progressIndicator: const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
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
                    // maxFramesPerSecond: 10,
                  ),
                  onImageForAnalysis: (image) {
                    final viewport = circleDiameter * 0.9;
                    final viewportSize = Size(viewport, viewport);

                    // Adjust viewport size for different devices
                    // final adjustedViewportSize = Size(
                    //   viewportSize.width *
                    //       MediaQuery.of(Get.context!).devicePixelRatio,
                    //   viewportSize.height *
                    //       MediaQuery.of(Get.context!).devicePixelRatio,
                    // );

                    return controller.analyzeImage(image, viewportSize);
                  },
                  builder: (state, preview) {
                    // controller.cameraState = state;
                    state.when(
                      onPreparingCamera: (state) => const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                      onPhotoMode: (photoState) {
                        controller.photoState = photoState;
                      },
                    );

                    return const SizedBox.shrink();
                  },
                  onMediaCaptureEvent: (event) {
                    switch ((event.status, event.isPicture, event.isVideo)) {
                      case (MediaCaptureStatus.capturing, true, false):
                        debugPrint('faceSetup: Capturing picture...');
                      case (MediaCaptureStatus.success, true, false):
                        event.captureRequest.when(
                          single: (single) {
                            debugPrint(
                                'faceSetup: Picture saved = ${single.file?.path}');
                          },
                        );
                      case (MediaCaptureStatus.failure, true, false):
                        debugPrint(
                            'faceSetup: Failed to capture picture = ${event.exception}');
                      default:
                        debugPrint('Unknown event: $event');
                    }
                  },
                  saveConfig: SaveConfig.photo(
                    pathBuilder: (sensors) async {
                      final extDir = await getTemporaryDirectory();
                      final testDir = await Directory('${extDir.path}/img')
                          .create(recursive: true);

                      if (sensors.length == 1) {
                        final filePath =
                            '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
                        print('filePathBuilder = $filePath');

                        return SingleCaptureRequest(filePath, sensors.first);
                      }

                      // final imagePath = await SaveHelper.getSavePath(
                      //   DateTime.now().toIso8601String(),
                      // );

                      // if (imagePath != null) {
                      // print('imagePathBuilder = $imagePath');

                      // if (!await file.exists()) {
                      //   try {
                      //     await file.create(recursive: true);
                      //     return SingleCaptureRequest(imagePath, sensors.first);
                      //   } catch (e) {
                      //     Logger().e('Error: create folder async = $e');
                      //   }
                      // }

                      // return SingleCaptureRequest(imagePath, sensors.first);
                      // }

                      return SingleCaptureRequest(null, sensors.first);
                    },
                    exifPreferences: ExifPreferences(saveGPSLocation: false),
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
    // if (controller.statusAbsenceArgs != StatusAbsenceSetup.register) {
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
        const Text(
          // 'Pastikan wajah Anda berada di dalam lingkaran dan tersenyum',
          'Pastikan wajah Anda dalam bingkai dan senyum ke arah layar',
          textAlign: TextAlign.center,
        ),
      ],
    );
    // }
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
