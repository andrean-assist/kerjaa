import 'package:assist_hadir/utils/constants_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import '../../../../shared/shared_theme.dart';
import '../../../helpers/text_helper.dart';

class CustomTextFormFieldNew extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool isRequired;
  final String? initialValue;
  final String labelText;
  final String? hintText;
  final int? hintMaxLines;
  final String? helperText;
  final int? helperMaxLines;
  final String? errorText;
  final int? errorMaxLines;
  final String? prefixAssetIconPath;
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
  final String? obscuringChar;
  final TextAlign textAlign;
  final int? maxLines;
  final int? maxLength;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final Function(String)? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormFieldNew({
    super.key,
    this.controller,
    this.focusNode,
    this.isRequired = false,
    this.initialValue,
    required this.labelText,
    this.hintText,
    this.hintMaxLines,
    this.helperText,
    this.helperMaxLines,
    this.errorText,
    this.errorMaxLines,
    this.prefixAssetIconPath,
    this.suffixText,
    this.suffixIcon,
    this.suffixIconState,
    required this.isFilled,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.words,
    this.textInputAction = TextInputAction.next,
    this.style,
    this.isReadOnly = false,
    this.isAutoCorrect = false,
    this.isAutoFocus = false,
    this.isEnable = true,
    this.isLabel = false,
    this.isDense = false,
    this.isNumericOnly = false,
    this.obscureText = false,
    this.obscuringChar,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.maxLength,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _builderLabel(context),
        _builderTextField(context),
      ],
    );
  }

  Widget _builderLabel(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    if (labelText != '' && !isLabel) {
      return Column(
        children: [
          if (isRequired)
            TextHelper.buildRichText(
              text: '$labelText *',
              highlight: '*',
              highlightStyle: textTheme.titleSmall!.copyWith(
                color: SharedTheme.errorColor,
              ),
              defaultStyle: textTheme.titleSmall,
            )
          else
            Text(
              labelText,
              style: theme.textTheme.titleSmall,
              maxLines: 1,
            ),
          const SizedBox(height: 8),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  Widget _builderTextField(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      focusNode: focusNode,
      textAlignVertical: (isNumericOnly) ? TextAlignVertical.center : null,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        labelText: (isLabel) ? '$labelText ${isRequired ? '*' : ''}' : null,
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
        prefixIcon: (prefixAssetIconPath != null)
            ? Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  prefixAssetIconPath ?? '',
                  width: 24,
                  height: 24,
                ),
              )
            : null,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: _builderSuffixIcon(theme),
        ),
        suffixText: suffixText,
        filled: isFilled,
        fillColor: theme.colorScheme.surface,
        isDense: isDense,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(30),
        //   borderSide: const BorderSide(color: Colors.blue, width: 1),
        // ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      style: style ?? textTheme.bodyMedium,
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
      // onTapOutside: (event) => FocusScope.of(context).unfocus(),
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

  Widget? _builderSuffixIcon(ThemeData theme) {
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
          return GestureDetector(
            onTap: controller?.clear,
            child: Image.asset(
              ConstantsAssets.icClear,
              width: 24,
              height: 24,
            ),
          );
        }
        return const SizedBox.shrink();
      }
      return null;
    }
  }
}
