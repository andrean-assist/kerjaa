import 'package:flutter/material.dart';

import '../../../../shared/shared_enum.dart';
import 'custom_chip.dart';

abstract class Chips {
  static Widget elevated({
    double? width,
    double? height,
    Icon? icon,
    IconAlignment? iconAlignment,
    ButtonStyle? style,
    bool state = false,
    required Function()? onPressed,
    required Widget child,
  }) {
    return CustomChip(
      type: ChipType.elevated,
      width: width,
      height: height,
      icon: icon,
      iconAlignment: iconAlignment,
      onPressed: onPressed,
      style: style,
      state: state,
      child: child,
    );
  }

  static Widget filled({
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
    Widget? icon,
    IconAlignment? iconAlignment,
    ButtonStyle? style,
    bool state = false,
    required Function()? onPressed,
    required Widget child,
  }) {
    return CustomChip(
      type: ChipType.filled,
      width: width,
      height: height,
      margin: margin,
      icon: icon,
      iconAlignment: iconAlignment,
      onPressed: onPressed,
      style: style,
      state: state,
      child: child,
    );
  }

  static Widget filledTonal({
    double? width,
    double? height,
    Icon? icon,
    IconAlignment? iconAlignment,
    ButtonStyle? style,
    bool state = false,
    required Function()? onPressed,
    required Widget child,
  }) {
    return CustomChip(
      type: ChipType.filledTonal,
      width: width,
      height: height,
      icon: icon,
      iconAlignment: iconAlignment,
      onPressed: onPressed,
      style: style,
      state: state,
      child: child,
    );
  }

  static Widget outlined({
    double? width,
    double? height,
    Icon? icon,
    IconAlignment? iconAlignment,
    ButtonStyle? style,
    bool state = false,
    required Function()? onPressed,
    required Widget child,
  }) {
    return CustomChip(
      type: ChipType.outlined,
      width: width,
      height: height,
      icon: icon,
      iconAlignment: iconAlignment,
      onPressed: onPressed,
      style: style,
      state: state,
      child: child,
    );
  }
}
