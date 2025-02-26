import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/shared_enum.dart';
import '../../../../shared/shared_theme.dart';

class CustomChip extends StatelessWidget {
  final ChipType type;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final Widget? icon;
  final IconAlignment? iconAlignment;
  final Widget child;
  final ButtonStyle? style;
  final VoidCallback? onPressed;
  final bool state;

  const CustomChip({
    super.key,
    required this.type,
    this.width,
    this.height,
    this.margin,
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

    return Container(
      width: width,
      margin: margin,
      child: builderChip(colors),
    );
  }

  Widget builderChip(ColorScheme colors) {
    return switch (type) {
      ChipType.elevated => builderElevated(colors),
      ChipType.filled => builderFilled(colors),
      ChipType.filledTonal => builderFilledTonal(colors),
      ChipType.outlined => builderOutlined(colors),
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
            style: style?.copyWith(
                  fixedSize: const WidgetStatePropertyAll(Size.fromHeight(60)),
                  textStyle: WidgetStatePropertyAll(
                    Get.context!.textTheme.titleSmall?.copyWith(
                      fontWeight: SharedTheme.semiBold,
                      fontSize: 16,
                    ),
                  ),
                ) ??
                FilledButton.styleFrom(
                  backgroundColor: SharedTheme.filledBtnColor,
                  foregroundColor: Colors.white,
                  fixedSize: const Size.fromHeight(60),
                  textStyle: Get.context!.textTheme.titleSmall?.copyWith(
                    fontWeight: SharedTheme.semiBold,
                    fontSize: 16,
                  ),
                ),
          )
        : FilledButton(
            onPressed: state ? null : onPressed,
            style: style ??
                FilledButton.styleFrom(
                  backgroundColor: SharedTheme.filledBtnColor,
                  foregroundColor: Colors.white,
                  fixedSize: const Size.fromHeight(60),
                  textStyle: const TextStyle(
                    fontWeight: SharedTheme.semiBold,
                    fontSize: 16,
                  ),
                ),
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
            style: style ??
                FilledButton.styleFrom(
                  backgroundColor: SharedTheme.filledTonalBtnColor,
                  foregroundColor: SharedTheme.textBtnColor,
                  fixedSize: const Size.fromHeight(60),
                  textStyle: const TextStyle(
                    fontWeight: SharedTheme.semiBold,
                    fontSize: 16,
                  ),
                ),
          )
        : FilledButton.tonal(
            onPressed: state ? null : onPressed,
            style: style ??
                FilledButton.styleFrom(
                  backgroundColor: SharedTheme.filledTonalBtnColor,
                  foregroundColor: SharedTheme.textBtnColor,
                  fixedSize: const Size.fromHeight(60),
                  textStyle: const TextStyle(
                    fontWeight: SharedTheme.semiBold,
                    fontSize: 16,
                  ),
                ),
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
}
