import 'package:flutter/material.dart';

import '../../../../shared/shared_enum.dart';
import 'custom_button.dart';

abstract class Buttons {
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
    return CustomButton(
      type: ButtonType.elevated,
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
    Icon? icon,
    IconAlignment? iconAlignment,
    ButtonStyle? style,
    bool state = false,
    required Function()? onPressed,
    required Widget child,
  }) {
    return CustomButton(
      type: ButtonType.filled,
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
    return CustomButton(
      type: ButtonType.filledTonal,
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
    return CustomButton(
      type: ButtonType.outlined,
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

  static Widget text({
    double? width,
    double? height,
    Icon? icon,
    IconAlignment? iconAlignment,
    ButtonStyle? style,
    bool state = false,
    required Function()? onPressed,
    required Widget child,
  }) {
    return CustomButton(
      type: ButtonType.text,
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
