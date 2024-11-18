import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/shared_enum.dart';

class CustomButton extends StatelessWidget {
  final ButtonType type;
  final double? width;
  final double? height;
  final Icon? icon;
  final IconAlignment? iconAlignment;
  final Widget child;
  final ButtonStyle? style;
  final VoidCallback? onPressed;
  final bool state;

  const CustomButton({
    super.key,
    required this.type,
    this.width,
    this.height,
    this.icon,
    this.iconAlignment,
    required this.child,
    this.style,
    this.onPressed,
    this.state = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colorScheme;
    final heightCtx = context.height;

    return SizedBox(
      width: width,
      // height: height ?? heightCtx * 0.055,
      child: builderButton(colors),
    );
  }

  Widget builderButton(ColorScheme colors) {
    return switch (type) {
      ButtonType.elevated => builderElevated(colors),
      ButtonType.filled => builderFilled(colors),
      ButtonType.filledTonal => builderFilledTonal(colors),
      ButtonType.outlined => builderOutlined(colors),
      ButtonType.text => builderText(colors),
    };
  }

  Widget builderElevated(ColorScheme colors) {
    return (icon != null)
        ? ElevatedButton.icon(
            onPressed: onPressed,
            icon: icon!,
            iconAlignment: iconAlignment ?? IconAlignment.start,
            label: child,
            style: style,
          )
        : ElevatedButton(
            onPressed: state ? null : onPressed,
            style: style,
            child: (state)
                ? SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: colors.primary,
                    ),
                  )
                : child,
          );
  }

  Widget builderFilled(ColorScheme colors) {
    return (icon != null)
        ? FilledButton.icon(
            onPressed: onPressed,
            icon: icon!,
            iconAlignment: iconAlignment ?? IconAlignment.start,
            label: child,
            style: style,
          )
        : FilledButton(
            onPressed: state ? null : onPressed,
            style: style,
            child: (state)
                ? SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: colors.surface,
                    ),
                  )
                : child,
          );
  }

  Widget builderFilledTonal(ColorScheme colors) {
    return (icon != null)
        ? FilledButton.tonalIcon(
            onPressed: onPressed,
            icon: icon!,
            iconAlignment: iconAlignment ?? IconAlignment.start,
            label: child,
            style: style,
          )
        : FilledButton.tonal(
            onPressed: state ? null : onPressed,
            style: style,
            child: (state)
                ? SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: colors.onSecondaryContainer,
                    ),
                  )
                : child,
          );
  }

  Widget builderOutlined(ColorScheme colors) {
    return (icon != null)
        ? OutlinedButton.icon(
            onPressed: onPressed,
            icon: icon!,
            iconAlignment: iconAlignment ?? IconAlignment.start,
            label: child,
            style: style,
          )
        : OutlinedButton(
            onPressed: state ? null : onPressed,
            style: style,
            child: (state)
                ? SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: colors.primary,
                    ),
                  )
                : child,
          );
  }

  Widget builderText(ColorScheme colors) {
    return (icon != null)
        ? TextButton.icon(
            onPressed: onPressed,
            icon: icon!,
            label: child,
            style: style,
            iconAlignment: iconAlignment ?? IconAlignment.start,
          )
        : TextButton(
            onPressed: state ? null : onPressed,
            style: style,
            child: (state)
                ? SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: colors.primary,
                    ),
                  )
                : child,
          );
  }
}
