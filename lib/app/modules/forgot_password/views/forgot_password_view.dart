import 'package:assist_hadir/shared/shared_theme.dart';
import 'package:assist_hadir/utils/constants_strings.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/constants_assets.dart';
import '../../../helpers/validations.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/textform_fields/custom_textform_field_new.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kembali',
          style: TextStyle(fontWeight: SharedTheme.semiBold),
        ),
        centerTitle: false,
        leadingWidth: 32,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'Ganti password Anda',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: SharedTheme.bold,
                  fontSize: 20,
                ),
                maxFontSize: 20,
              ),
              const SizedBox(height: 8),
              const AutoSizeText(
                'Kami akan mengirimkan email untuk melakukan ganti kata sandi baru.',
                minFontSize: 14,
              ),
              const SizedBox(height: 36),
              CustomTextFormFieldNew(
                controller: controller.emailC,
                labelText: ConstantsStrings.labelEmail,
                hintText: ConstantsStrings.hintEmail,
                isFilled: true,
                prefixAssetIconPath: ConstantsAssets.icMessage,
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                maxLines: 1,
                onFieldSubmitted: (_) => controller.moveToCheckEmail(),
                validator: (value) => Validation.formField(
                  value: value,
                  titleField: ConstantsStrings.labelEmail,
                  isEmail: true,
                ),
              ),
              const SizedBox(height: 24),
              Obx(
                () => Buttons.filled(
                  width: double.infinity,
                  state: controller.isLoading.value,
                  onPressed: controller.email.value.isNotEmpty
                      ? controller.moveToCheckEmail
                      : null,
                  child: const Text('Masuk'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
