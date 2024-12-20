import 'package:flutter/material.dart';
import 'dart:math';

class DashedCirclePainter extends CustomPainter {
  final double progress;

  DashedCirclePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    // Pengaturan ukuran lingkaran
    final radius = size.width / 2;
    const dashWidth = 30;
    const dashSpace = 10;
    final paint = Paint()
      ..color = const Color(0xFF94A3B8)
      ..strokeWidth = 15
      ..style = PaintingStyle.stroke;

    final greenPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 15
      ..style = PaintingStyle.stroke;

    if (progress != 1) {
      // Menggambar garis putus-putus abu-abu
      final circumference = 2 * pi * radius;
      final dashCount = circumference / (dashWidth + dashSpace);

      for (int i = 0; i < dashCount; i++) {
        final startAngle = (i * (dashWidth + dashSpace)) / radius;
        final sweepAngle = dashWidth / radius;
        final isWithinProgress = i / dashCount < progress;

        canvas.drawArc(
          Rect.fromCircle(center: Offset(radius, radius), radius: radius),
          startAngle,
          sweepAngle,
          false,
          isWithinProgress ? greenPaint : paint,
        );
      }
    } else {
      greenPaint.strokeWidth = 5;

      // progress selesai
      canvas.drawCircle(
        Offset(radius, radius),
        radius,
        greenPaint,
      );
    }
  }

  @override
  bool shouldRepaint(DashedCirclePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
