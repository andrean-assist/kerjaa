import 'package:flutter/material.dart';

import 'custom_card.dart';

class Cards {
  static Widget elevated({
    EdgeInsets? outPadding,
    EdgeInsets? inPadding,
    required Widget child,
    Clip? clip,
  }) {
    return CustomCard(
      outPadding: outPadding,
      inPadding: inPadding,
      child: child,
    );
  }

  static Widget filled({
    required BuildContext context,
    EdgeInsets? outPadding,
    EdgeInsets? inPadding,
    Clip? clip,
    required Widget child,
    ShapeBorder? shape,
    Color? color,
  }) {
    return CustomCard(
      elevation: 0,
      outPadding: outPadding,
      inPadding: inPadding,
      shape: shape,
      color: color ?? Theme.of(context).colorScheme.surfaceContainerHighest,
      child: child,
    );
  }

  static Widget outlined({
    required BuildContext context,
    EdgeInsets? outPadding,
    EdgeInsets? inPadding,
    Clip? clip,
    required Widget child,
    Color? color,
  }) {
    return CustomCard(
      outPadding: outPadding,
      inPadding: inPadding,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: child,
    );
  }
}
