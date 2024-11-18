import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/shared_theme.dart';
import '../../widgets/buttons/buttons.dart';
import '../controllers/face_setup_controller.dart';
import '../widgets/progress/dashed_circle_progress.dart';

class ReadyFaceScreenNew extends GetView<FaceSetupController> {
  final double circleDiameter;

  const ReadyFaceScreenNew(this.circleDiameter, {super.key});

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
                  previewFit: CameraPreviewFit.cover,
                  imageAnalysisConfig: AnalysisConfig(
                    androidOptions: AndroidAnalysisOptions.nv21(
                      width: (circleDiameter * 0.9).toInt(),
                    ),
                    maxFramesPerSecond: 10,
                  ),
                  onImageForAnalysis: controller.analyzeImage,
                  sensorConfig: SensorConfig.single(
                    sensor: Sensor.position(SensorPosition.front),
                    aspectRatio: CameraAspectRatios.ratio_1_1,
                  ),
                  builder: (state, preview) {
                    return const SizedBox.shrink();
                  },
                  saveConfig: SaveConfig.photo(
                    exifPreferences: ExifPreferences(saveGPSLocation: true),
                  ),
                ),
                // child: CameraAwesomeBuilder.previewOnly(
                //   // topActionsBuilder: (state) => const SizedBox.shrink(),
                //   // middleContentBuilder: (state) => state.,
                //   // bottomActionsBuilder: (state) => const SizedBox.shrink(),
                //   previewFit: CameraPreviewFit.cover,
                //   sensorConfig: SensorConfig.single(
                //     sensor: Sensor.position(SensorPosition.front),
                //     aspectRatio: CameraAspectRatios.ratio_1_1,
                //   ),
                //   imageAnalysisConfig: AnalysisConfig(
                //     androidOptions: AndroidAnalysisOptions.nv21(
                //       width: (circleDiameter * 0.9).toInt(),
                //     ),
                //     maxFramesPerSecond: 10,
                //   ),
                //   onImageForAnalysis: controller.analyzeImage,
                //   // saveConfig: SaveConfig.photo(
                //   //   exifPreferences: ExifPreferences(saveGPSLocation: true),
                //   // ),
                //   builder: (state, preview) => const SizedBox.shrink(),

                //   // builder: (state, preview) => Obx(
                //   //   () => CustomPaint(
                //   //     painter: FacePainter(
                //   //       faceDetectionModel: controller.faceDetectionC.value,
                //   //     ),
                //   //     willChange: true,
                //   //   ),
                //   // ),
                // ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _builderHint(TextTheme textTheme) {
    return Text(
      'Gerakan kepala Anda secara perlahan',
      style: textTheme.titleLarge?.copyWith(
        fontWeight: SharedTheme.bold,
        fontSize: 20,
      ),
    );
  }

  Widget _builderButton() {
    return Obx(
      () => Buttons.filled(
        width: double.infinity,
        onPressed: (controller.faceDetectionC.value != null)
            ? controller.initCamera
            : null,
        child: const Text('Ambil Gambar'),
      ),
    );
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
