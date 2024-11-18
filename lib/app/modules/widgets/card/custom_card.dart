import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final EdgeInsets? outPadding;
  final EdgeInsets? inPadding;
  final ShapeBorder? shape;
  final Color? color;
  final double? elevation;
  final Clip? clip;
  final Widget child;

  const CustomCard({
    super.key,
    this.outPadding,
    this.inPadding,
    this.shape,
    this.color,
    this.elevation,
    this.clip,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outPadding ?? EdgeInsets.zero,
      child: Card(
        shape: shape,
        color: color,
        elevation: elevation,
        clipBehavior: clip,
        child: Padding(
          padding: inPadding ??
              const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
          child: child,
        ),
      ),
    );
  }
}
