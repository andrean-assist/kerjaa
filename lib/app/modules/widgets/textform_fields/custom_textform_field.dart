import 'package:assist_hadir/shared/shared_theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../helpers/text_helper.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool isRequired;
  final String? initialValue;
  final String title;
  final String? hintText;
  final int? hintMaxLines;
  final String? helperText;
  final int? helperMaxLines;
  final String? errorText;
  final int? errorMaxLines;
  final String? assetIconPath;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? suffixText;
  final bool? suffixIconState;
  final bool isFilled;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final TextStyle? style;
  final bool isReadOnly;
  final bool isAutoCorrect;
  final bool isAutoFocus;
  final bool isEnable;
  final bool isLabel;
  final bool isDense;
  final bool isNumericOnly;
  final bool obscureText;
  final TextAlign textAlign;
  final int? maxLines;
  final int? maxLength;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  // final VoidCallback? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.focusNode,
    this.isRequired = false,
    this.initialValue,
    required this.title,
    this.hintText,
    this.hintMaxLines,
    this.helperText,
    this.helperMaxLines = 2,
    this.errorText,
    this.errorMaxLines = 5,
    this.assetIconPath,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixText,
    this.suffixIconState,
    required this.isFilled,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.words,
    this.textInputAction = TextInputAction.next,
    this.style,
    this.isAutoCorrect = false,
    this.isAutoFocus = false,
    this.isReadOnly = false,
    this.isEnable = true,
    this.isLabel = false,
    this.isDense = false,
    this.isNumericOnly = false,
    this.obscureText = false,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.maxLength,
    this.onTap,
    this.onChanged,
    // this.onEditingComplete,
    this.onFieldSubmitted,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        builderTitle(theme, textTheme),
        builderTextForm(context),
      ],
    );
  }

  Widget builderTitle(ThemeData theme, TextTheme textTheme) {
    if (title != '' && !isLabel) {
      return Column(
        children: [
          if (isRequired)
            TextHelper.buildRichText(
              text: '$title *',
              highlight: '*',
              highlightStyle: textTheme.titleSmall!.copyWith(
                color: SharedTheme.errorColor,
              ),
              defaultStyle: textTheme.titleSmall,
            )
          else
            Text(
              title,
              style: theme.textTheme.titleSmall,
              maxLines: 1,
            ),
          const SizedBox(height: 8),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  Widget? builderSuffixIcon(ThemeData theme) {
    if (suffixIcon != null) {
      return suffixIcon;
    } else {
      if (isNumericOnly) {
        return IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                type: MaterialType.transparency,
                child: InkWell(
                  splashColor: theme.focusColor,
                  customBorder: const CircleBorder(),
                  onTap: () {
                    var value = int.tryParse(controller?.text ?? '0') ?? 0;
                    value++;
                    controller?.text = value.toString();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.arrow_drop_up,
                    ),
                  ),
                ),
              ),
              Material(
                type: MaterialType.transparency,
                child: InkWell(
                  splashColor: theme.focusColor,
                  customBorder: const CircleBorder(),
                  onTap: () {
                    var value = int.tryParse(controller?.text ?? '0') ?? 0;
                    if (value > 0) {
                      value--;
                      controller?.text = value.toString();
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 2),
                    child: Icon(
                      Icons.arrow_drop_down,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      if (suffixIconState != null) {
        if (suffixIconState!) {
          return IconButton(
            onPressed: () => controller?.clear(),
            icon: const Icon(Icons.cancel_outlined),
          );
        }

        return const SizedBox.shrink();
      }
    }
    return null;
  }

  Widget builderTextForm(BuildContext context) {
    final theme = context.theme;

    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      focusNode: focusNode,
      textAlignVertical: (isNumericOnly) ? TextAlignVertical.center : null,
      decoration: InputDecoration(
        labelText: (isLabel) ? '$title ${isRequired ? '*' : ''}' : null,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontWeight: SharedTheme.regular,
          fontSize: 14,
        ),
        hintMaxLines: hintMaxLines,
        helperText: helperText,
        helperMaxLines: helperMaxLines,
        errorText: errorText,
        errorMaxLines: errorMaxLines,
        // prefixIcon: (prefixIcon != null) ? prefixIcon : null,
        prefixIcon: (assetIconPath != null)
            ? Padding(
                padding: const EdgeInsets.all(12.0), // Padding to center icon
                child: Image.asset(
                  assetIconPath!, // Path to your external icon
                  width: 24,
                  height: 24,
                ),
              )
            : null,
        suffixIcon: builderSuffixIcon(theme),
        suffixText: suffixText,
        filled: isFilled,
        isDense: isDense,
        border: (!isFilled)
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: theme.colorScheme.outline,
                ),
                borderRadius: BorderRadius.circular(10000),
              )
            : null,
      ),
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      style: style,
      readOnly: isReadOnly,
      obscureText: obscureText,
      autocorrect: isAutoCorrect,
      autofocus: isAutoFocus,
      maxLines: (keyboardType == TextInputType.multiline)
          ? null
          : (obscureText)
              ? 1
              : maxLines,
      maxLength: (keyboardType == TextInputType.multiline) ? null : maxLength,
      onChanged: onChanged,
      onTap: onTap,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      // onEditingComplete: () => FocusScope.of(context).nextFocus(),
      onFieldSubmitted:
          onFieldSubmitted ?? (_) => FocusScope.of(context).nextFocus(),
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlign: textAlign,
      buildCounter: (
        context, {
        required currentLength,
        required isFocused,
        maxLength,
      }) =>
          null,
      enabled: isEnable,
      inputFormatters: inputFormatters,
    );
  }
}
