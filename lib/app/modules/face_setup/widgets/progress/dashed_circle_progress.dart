import 'package:flutter/material.dart';

import 'painter/dashed_circle_painter.dart';

class DashedCircleProgress extends StatelessWidget {
  final double progress;
  final double circleDiameter;

  const DashedCircleProgress({
    super.key,
    required this.progress,
    required this.circleDiameter,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(circleDiameter, circleDiameter), // Ukuran lingkaran
      foregroundPainter: DashedCirclePainter(progress: progress),
    );
  }
}
