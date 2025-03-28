// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../shared/shared_theme.dart';
import '../../../../utils/constants_assets.dart';
import '../../../../utils/constants_strings.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/textform_fields/custom_textform_field_new.dart';
import '../controllers/create_new_password_controller.dart';

class CreateNewPasswordView extends GetView<CreateNewPasswordController> {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: controller.moveToLogin,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: const Text(
          'Kembali',
          style: TextStyle(fontWeight: SharedTheme.semiBold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(textTheme),
            const SizedBox(height: 8),
            _buildSubtitle(),
            const SizedBox(height: 36),
            _buildPasswordField(),
            const SizedBox(height: 8),
            _buildPasswordCriteria(),
            const SizedBox(height: 24),
            _buildRepeatPasswordField(),
            const SizedBox(height: 24),
            _buildResetButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(TextTheme textTheme) {
    return AutoSizeText(
      'Buat password baru',
      style: textTheme.titleLarge?.copyWith(
        fontWeight: SharedTheme.bold,
        fontSize: 20,
      ),
      maxFontSize: 20,
    );
  }

  Widget _buildSubtitle() {
    return const AutoSizeText(
      'Buat password baru Anda berbeda dari password sebelumnya.',
      minFontSize: 14,
    );
  }

  Widget _buildPasswordField() {
    return Obx(
      () {
        final isVisible = controller.isVisiblePassword.value;
        return CustomTextFormFieldNew(
          controller: controller.passwordC,
          focusNode: controller.passwordF,
          labelText: ConstantsStrings.labelPassword,
          hintText: ConstantsStrings.hintPassword,
          isFilled: true,
          obscureText: !isVisible,
          keyboardType: TextInputType.visiblePassword,
          textCapitalization: TextCapitalization.none,
          maxLines: 1,
          textInputAction: TextInputAction.done,
          prefixAssetIconPath: ConstantsAssets.icLock,
          onFieldSubmitted: (_) => controller.repeatPasswordF.requestFocus(),
          suffixIcon: GestureDetector(
            onTap: controller.isVisiblePassword.toggle,
            child: SvgPicture.asset(
              isVisible
                  ? ConstantsAssets.icOpenEye
                  : ConstantsAssets.icCloseEye,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                SharedTheme.lightIconColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          validator: (value) {
            controller.passwordV.value = value;
            return null;
          },
        );
      },
    );
  }

  Widget _buildPasswordCriteria() {
    return Obx(() {
      final password = controller.password.value;
      final isMinLength = GetUtils.isGreaterThan(password.length, 8);
      final isCombineCharsUppercaseAndLowerCase =
          GetUtils.hasCapitalletter(controller.password.value);
      final containsNumbers = GetUtils.hasMatch(password, r'[0-9]');
      final containsSymbols =
          GetUtils.hasMatch(password, r'[!@#\$%^&*(),.?":{}|<>]');
      final isHasNumberAndSymbol = containsNumbers && containsSymbols;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          _buildCriteriaRow(
            'Minimal 8 karakter',
            color: isMinLength
                ? SharedTheme.textSuccessColor
                : SharedTheme.disabledColor,
          ),
          _buildCriteriaRow(
            'Kombinasi huruf besar dan kecil',
            color: isCombineCharsUppercaseAndLowerCase
                ? SharedTheme.textSuccessColor
                : SharedTheme.disabledColor,
          ),
          _buildCriteriaRow(
            'Dikombinasikan dengan angka dan simbol (!@\$%)',
            color: isHasNumberAndSymbol
                ? SharedTheme.textSuccessColor
                : SharedTheme.disabledColor,
            isExpanded: true,
          ),
        ],
      );
    });
  }

  Widget _buildCriteriaRow(
    String text, {
    bool isExpanded = false,
    Color color = SharedTheme.disabledColor,
  }) {
    final widgetText = Text(
      text,
      style: TextStyle(color: color),
    );

    return Row(
      children: [
        Icon(
          Icons.check_circle_outline_rounded,
          color: color,
          size: 18,
        ),
        const SizedBox(width: 4),
        isExpanded ? Expanded(child: widgetText) : widgetText,
      ],
    );
  }

  Widget _buildRepeatPasswordField() {
    return Obx(
      () {
        final isVisible = controller.isVisibleRepeatPassword.value;
        return CustomTextFormFieldNew(
          controller: controller.repeatPasswordC,
          focusNode: controller.repeatPasswordF,
          labelText: ConstantsStrings.labelRepeatPassword,
          hintText: ConstantsStrings.hintRepeatPassword,
          isFilled: true,
          obscureText: !isVisible,
          keyboardType: TextInputType.visiblePassword,
          textCapitalization: TextCapitalization.none,
          maxLines: 1,
          textInputAction: TextInputAction.done,
          prefixAssetIconPath: ConstantsAssets.icLock,
          onFieldSubmitted: (_) => controller.resetPassword(),
          suffixIcon: GestureDetector(
            onTap: controller.isVisibleRepeatPassword.toggle,
            child: SvgPicture.asset(
              isVisible
                  ? ConstantsAssets.icOpenEye
                  : ConstantsAssets.icCloseEye,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                SharedTheme.lightIconColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          validator: (value) {
            if (controller.password.value != value) {
              return 'Password tidak sama';
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildResetButton() {
    return Obx(
      () {
        final isEnabled = controller.password.value.isNotEmpty &&
            controller.repeatPassword.value.isNotEmpty;
        final isLoading = controller.isLoading.value;
        final isMatch =
            controller.password.value == controller.repeatPassword.value;
        return Buttons.filled(
          width: double.infinity,
          state: isLoading,
          onPressed: (isEnabled && isMatch) ? controller.resetPassword : null,
          child: const Text('Reset Password'),
        );
      },
    );
  }
}
