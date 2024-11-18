import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final double dashWidth;
  final double dashSpace;
  final double lineThickness;
  final Color color;

  DashedLine({
    this.dashWidth = 4.0,
    this.dashSpace = 4.0,
    this.lineThickness = 2.0,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Menghitung jumlah dash yang dapat muat di lebar layar
        final dashCount =
            (constraints.maxWidth / (dashWidth + dashSpace)).floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (index) {
            return Container(
              width: dashWidth,
              height: lineThickness,
              color: color,
            );
          }),
        );
      },
    );
  }
}

class DottedLineExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DashedLine(
            dashWidth: 5.0,
            dashSpace: 5.0,
            lineThickness: 2.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
