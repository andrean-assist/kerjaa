import 'package:assist_hadir/app/helpers/text_helper.dart';
import 'package:assist_hadir/utils/constants_assets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../shared/shared_theme.dart';
import '../../../../utils/constants_strings.dart';
import '../../../helpers/validations.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/textform_fields/custom_textform_field_new.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                ConstantsAssets.icLogoLite,
              ),
              const SizedBox(height: 14),
              Text(
                'Masuk ke Akun',
                // minFontSize: 20,
                style: textTheme.headlineSmall?.copyWith(
                  fontSize: 20,
                  fontWeight: SharedTheme.bold,
                ),
              ),
              const SizedBox(height: 8),
              AutoSizeText(
                'Masuk ke akun Anda dan rasakan kemudahan absen hanya dengan satu aplikasi.',
                maxFontSize: 14,
                style: textTheme.bodyLarge?.copyWith(
                  color: theme.hintColor,
                  fontWeight: SharedTheme.regular,
                ),
              ),
              const SizedBox(height: 24),
              _builderForm(),
              TextButton(
                onPressed: controller.moveToForgotPassword,
                child: const Text(
                  'Lupa Password ?',
                  style: TextStyle(fontWeight: SharedTheme.semiBold),
                ),
              ),
              const SizedBox(height: 14),
              Obx(
                () {
                  final isEnabled = controller.email.value.isNotEmpty &&
                      controller.password.value.isNotEmpty;
                  final isLoading = controller.isLoading.value;

                  return Buttons.filled(
                    width: double.infinity,
                    state: isEnabled && controller.isLoading.value,
                    onPressed:
                        isEnabled && !isLoading ? controller.confirm : null,
                    child: const Text('Masuk'),
                  );
                },
              ),
              const Spacer(),
              Align(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextHelper.buildRichMultiText(
                      text: 'By log in, I agree to the Terms of Service',
                      highlights: ['Terms of Service'],
                      highlightStyle: TextStyle(
                        fontWeight: SharedTheme.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                      defaultStyle: TextStyle(
                        fontSize: 8,
                        color: theme.hintColor,
                        fontWeight: SharedTheme.medium,
                      ),
                      textAlign: TextAlign.center,
                      maxFontSize: 8,
                    ),
                    const SizedBox(height: 8),
                    const AutoSizeText(
                      '2024. Assist.id PT JAGA ANUGRAH GIAT ASA',
                      style: TextStyle(fontSize: 8),
                      minFontSize: 2,
                      maxFontSize: 8,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _builderForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          CustomTextFormFieldNew(
            controller: controller.emailC,
            focusNode: controller.emailF,
            labelText: ConstantsStrings.labelEmail,
            hintText: ConstantsStrings.hintEmail,
            isFilled: true,
            prefixAssetIconPath: ConstantsAssets.icMessage,
            keyboardType: TextInputType.emailAddress,
            textCapitalization: TextCapitalization.none,
            maxLines: 1,
            validator: (value) => Validation.formField(
              value: value,
              titleField: ConstantsStrings.labelEmail,
              isEmail: true,
            ),
            onFieldSubmitted: (_) => controller.passwordF.requestFocus(),
          ),
          const SizedBox(height: 21),
          Obx(
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
                onFieldSubmitted: (_) => controller.confirm(),
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
              );
            },
          ),
        
        ],
      ),
    );
  }
}
