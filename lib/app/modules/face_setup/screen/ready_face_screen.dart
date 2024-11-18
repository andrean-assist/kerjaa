// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import 'package:assist_hadir/app/modules/face_setup/controllers/face_setup_controller.dart';

import '../../widgets/buttons/buttons.dart';
import '../widgets/progress/dashed_circle_progress.dart';
import '../translator/coordinate_translator.dart';

class ReadyFaceScreen extends GetView<FaceSetupController> {
  final double circleDiameter;

  const ReadyFaceScreen(this.circleDiameter, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;
    final size = context.mediaQuerySize;
    // final deviceRatio = size.width / size.height;

    // final scale = 1 / (controller.cameraC.value.aspectRatio * size.aspectRatio);

    return CameraAwesomeBuilder.previewOnly(
      // saveConfig: SaveConfig.photo(),
      // imageAnalysisConfig: AnalysisConfig(),
      previewFit: CameraPreviewFit.contain,
      sensorConfig: SensorConfig.single(
        sensor: Sensor.position(SensorPosition.front),
        aspectRatio: CameraAspectRatios.ratio_1_1,
      ),
      onImageForAnalysis: (img) => _analyzeImage(img),
      imageAnalysisConfig: AnalysisConfig(
        androidOptions: const AndroidAnalysisOptions.nv21(
          width: 250,
        ),
        maxFramesPerSecond: 20,
      ),
      builder: (state, preview) {
        controller.preview.value = preview;
        return const SizedBox.shrink();
        // return _MyPreviewDecoratorWidget(
        //   cameraState: state,
        //   faceDetectionStream: controller.faceDetectionC.stream,
        //   preview: controller.preview.value!,
        // );
      },
    );

    // return Stack(
    //   children: [
    //     Transform.scale(
    //       scale: scale,
    //       child: CameraPreview(controller.cameraC),
    //     ),
    //     CustomPaint(
    //       size: size,
    //       painter: CameraOverlayPainter(),
    //     ),
    //     Align(
    //       alignment: Alignment.bottomCenter,
    //       child: Padding(
    //         padding: const EdgeInsets.only(bottom: 32.0),
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             Text(
    //               "Wajah Anda berhasil di daftarkan,\nAnda bisa mulai absen sekarang.",
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                 fontSize: 16,
    //                 fontWeight: FontWeight.w500,
    //                 color: Colors.black87,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );

    // return Stack(
    //   alignment: Alignment.center,
    //   children: [
    //     Transform.scale(
    //       scale: 1.1,
    //       // alignment: Alignment.center,
    //       child: CameraPreview(controller.cameraC),
    //     ),
    //     Positioned.fill(
    //       child: Stack(
    //         children: [
    //           // Background overlay
    //           // Container(
    //           //   color: Colors.black.withOpacity(1), // Semi-transparent black
    //           // ),
    //           // Circle hole in the center
    //           // Center(
    //           //   child: ClipOval(
    //           //     child: SizedBox(
    //           //       width: circleDiameter * 0.8,
    //           //       height: circleDiameter,
    //           //       child: Container(
    //           //         color: Colors.transparent,
    //           //       ),
    //           //     ),
    //           //   ),
    //           //   // child: ClipPath(
    //           //   //   clipper: CircleHoleClipper(),
    //           //   //   child: Container(
    //           //   //     color: Colors.transparent,
    //           //   //   ),
    //           //   // ),
    //           // ),
    //         ],
    //       ),
    //       // _builderCircle(textTheme),
    //       // ClipOval(
    //       //   child: SizedBox(
    //       //     width: circleDiameter * 0.8,
    //       //     height: circleDiameter,
    //       //     child: AspectRatio(
    //       //       // aspectRatio: controller.cameraC.value.aspectRatio,
    //       //       aspectRatio: 0,
    //       //       child: CameraPreview(
    //       //         controller.cameraC,
    //       //       ),
    //       //     ),
    //       //   ),
    //     )
    //   ],
    // );

    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     // _builderCircle(textTheme),
    //     // Text(
    //     //   'Gerakan kepala Anda secara perlahan',
    //     //   style: textTheme.titleLarge?.copyWith(
    //     //     fontWeight: SharedTheme.bold,
    //     //     fontSize: 20,
    //     //   ),
    //     // ),
    //     // _builderButton(),
    //   ],
    // );
  }

  Future _analyzeImage(AnalysisImage img) async {
    final inputImage = img.toInputImage();

    try {
      // controller.faceDetectionC.add(
      //   FaceDetectionModel(
      //     faces: await controller.faceDetector.processImage(inputImage),
      //     absoluteImageSize: inputImage.metadata!.size,
      //     imageRotation: img.inputImageRotation,
      //     img: img,
      //   ),
      // );
      // debugPrint("...sending image resulted with : ${faces?.length} faces");
    } catch (error) {
      debugPrint("...sending image resulted error $error");
    }
  }

  // Widget _builderCircle(TextTheme textTheme) {
  //   return Column(
  //     children: [
  //       Stack(
  //         alignment: Alignment.center,
  //         children: [
  //           DashedCircleProgress(
  //             circleDiameter: circleDiameter,
  //             progress: 0,
  //           ),
  //           ClipOval(
  //             child: SizedBox(
  //               width: circleDiameter * 0.8,
  //               height: circleDiameter * 0.8,
  //               child: Container(
  //                 color: Colors.transparent,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  // Widget _builderButton() {
  //   return Visibility(
  //     visible: true,
  //     child: Column(
  //       children: [
  //         Buttons.filled(
  //           width: double.infinity,
  //           onPressed: controller.initCamera,
  //           child: const Text('Mulai absen sekarang'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

class _MyPreviewDecoratorWidget extends StatelessWidget {
  final CameraState cameraState;
  final Stream<FaceDetectionModel> faceDetectionStream;
  final Preview preview;

  const _MyPreviewDecoratorWidget({
    required this.cameraState,
    required this.faceDetectionStream,
    required this.preview,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: StreamBuilder(
        stream: cameraState.sensorConfig$,
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return StreamBuilder<FaceDetectionModel>(
              stream: faceDetectionStream,
              builder: (_, faceModelSnapshot) {
                if (!faceModelSnapshot.hasData) return const SizedBox();
                // this is the transformation needed to convert the image to the preview
                // Android mirrors the preview but the analysis image is not
                final canvasTransformation = faceModelSnapshot.data!.img
                    ?.getCanvasTransformation(preview);
                return CustomPaint(
                  painter: FaceDetectorPainter(
                    model: faceModelSnapshot.requireData,
                    canvasTransformation: canvasTransformation,
                    preview: preview,
                  ),
                );
                // return CustomPaint(
                //   painter: FacePainter(),
                // );
              },
            );
          }
        },
      ),
    );
  }
}

// class FacePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint1 = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1.0
//       ..color = Colors.red;
//     final paint2 = Paint()
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 1.0
//       ..color = Colors.green;

//     for (var face in faces) {
//       final left = translateX(
//         face.boundingBox.left,
//         size,
//         imageSize,
//         rotation,
//         cameraLensDirection,
//       );
//       final top = translateY(
//         face.boundingBox.top,
//         size,
//         imageSize,
//         rotation,
//         cameraLensDirection,
//       );
//       final right = translateX(
//         face.boundingBox.right,
//         size,
//         imageSize,
//         rotation,
//         cameraLensDirection,
//       );
//       final bottom = translateY(
//         face.boundingBox.bottom,
//         size,
//         imageSize,
//         rotation,
//         cameraLensDirection,
//       );

//       canvas.drawRect(
//         Rect.fromLTRB(left, top, right, bottom),
//         paint1,
//       );
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return oldDelegate.model != model;
//   }
// }

class FaceDetectorPainter extends CustomPainter {
  final FaceDetectionModel model;
  final CanvasTransformation? canvasTransformation;
  final Preview? preview;

  FaceDetectorPainter({
    required this.model,
    this.canvasTransformation,
    this.preview,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (preview == null || model.img == null) {
      return;
    }
    // We apply the canvas transformation to the canvas so that the barcode
    // rect is drawn in the correct orientation. (Android only)
    if (canvasTransformation != null) {
      canvas.save();
      canvas.applyTransformation(canvasTransformation!, size);
    }

    for (final face in model.faces) {
      Map<FaceContourType, Path> paths = {
        for (var fct in FaceContourType.values) fct: Path()
      };

      face.contours.forEach((contourType, faceContour) {
        if (faceContour != null) {
          paths[contourType]!.addPolygon(
              faceContour.points
                  .map(
                    (element) => preview!.convertFromImage(
                      Offset(element.x.toDouble(), element.y.toDouble()),
                      model.img!,
                    ),
                  )
                  .toList(),
              true);
          for (var element in faceContour.points) {
            var position = preview!.convertFromImage(
              Offset(element.x.toDouble(), element.y.toDouble()),
              model.img!,
            );
            canvas.drawCircle(
              position,
              4,
              Paint()..color = Colors.blue,
            );
          }
        }
      });
      paths.removeWhere((key, value) => value.getBounds().isEmpty);
      for (var p in paths.entries) {
        canvas.drawPath(
            p.value,
            Paint()
              ..color = Colors.orange
              ..strokeWidth = 2
              ..style = PaintingStyle.stroke);
      }
    }
    // if you want to draw without canvas transformation, use this:
    // if (canvasTransformation != null) {
    //   canvas.restore();
    // }
  }

  @override
  bool shouldRepaint(FaceDetectorPainter oldDelegate) {
    return oldDelegate.model != model;
  }
}

extension InputImageRotationConversion on InputImageRotation {
  double toRadians() {
    final degrees = toDegrees();
    return degrees * 2 * pi / 360;
  }

  int toDegrees() {
    switch (this) {
      case InputImageRotation.rotation0deg:
        return 0;
      case InputImageRotation.rotation90deg:
        return 90;
      case InputImageRotation.rotation180deg:
        return 180;
      case InputImageRotation.rotation270deg:
        return 270;
    }
  }
}

class FaceDetectionModel {
  final List<Face> faces;
  final Size absoluteImageSize;
  final InputImageRotation imageRotation;
  final AnalysisImage? img;

  FaceDetectionModel({
    required this.faces,
    required this.absoluteImageSize,
    required this.imageRotation,
    this.img,
  });

  Size get croppedSize => img!.croppedSize;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FaceDetectionModel &&
          runtimeType == other.runtimeType &&
          faces == other.faces &&
          absoluteImageSize == other.absoluteImageSize &&
          imageRotation == other.imageRotation &&
          croppedSize == other.croppedSize;

  @override
  int get hashCode =>
      faces.hashCode ^
      absoluteImageSize.hashCode ^
      imageRotation.hashCode ^
      croppedSize.hashCode;
}

extension MLKitUtils on AnalysisImage {
  InputImage toInputImage() {
    return when(
      nv21: (image) {
        return InputImage.fromBytes(
          bytes: image.bytes,
          metadata: InputImageMetadata(
            rotation: inputImageRotation,
            format: InputImageFormat.nv21,
            size: image.size,
            bytesPerRow: image.planes.first.bytesPerRow,
          ),
        );
      },
      bgra8888: (image) {
        final inputImageData = InputImageMetadata(
          size: size,
          rotation: inputImageRotation,
          format: inputImageFormat,
          bytesPerRow: image.planes.first.bytesPerRow,
        );

        return InputImage.fromBytes(
          bytes: image.bytes,
          metadata: inputImageData,
        );
      },
    )!;
  }

  InputImageRotation get inputImageRotation =>
      InputImageRotation.values.byName(rotation.name);

  InputImageFormat get inputImageFormat {
    switch (format) {
      case InputAnalysisImageFormat.bgra8888:
        return InputImageFormat.bgra8888;
      case InputAnalysisImageFormat.nv21:
        return InputImageFormat.nv21;
      default:
        return InputImageFormat.yuv420;
    }
  }
}

// class CircleHoleClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
//     path.addOval(Rect.fromCircle(
//       center: Offset(size.width / 2, size.height / 2), // Center of the screen
//       radius: 150, // Adjust radius as needed
//     ));
//     path.fillType = PathFillType.evenOdd; // Create the "hole" effect
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

// class CameraOverlayPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;

//     final holePaint = Paint()
//       ..color = Colors.transparent
//       ..blendMode = BlendMode.color
//       ..style = PaintingStyle.fill;

//     // Background putih
//     canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

//     // Lingkaran transparan
//     final circleDiameter = size.width * 0.6; // 60% lebar layar
//     final center = Offset(size.width / 2, size.height / 2 - 50);
//     canvas.drawCircle(center, circleDiameter / 2, holePaint);

//     // Garis hijau pada lingkaran
//     final borderPaint = Paint()
//       ..color = Colors.green
//       ..strokeWidth = 4
//       ..style = PaintingStyle.stroke;

//     canvas.drawCircle(center, circleDiameter / 2, borderPaint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
