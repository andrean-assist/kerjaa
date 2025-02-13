import 'package:assist_hadir/app/helpers/text_helper.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../shared/shared_theme.dart';
import '../../../../utils/constants_assets.dart';
import '../../widgets/buttons/buttons.dart';
import '../controllers/check_email_controller.dart';

class CheckEmailView extends GetView<CheckEmailController> {
  const CheckEmailView({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const Visibility(
          visible: false,
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(ConstantsAssets.icEmail),
            const SizedBox(height: 8),
            AutoSizeText(
              'Cek email Anda.',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: SharedTheme.bold,
                fontSize: 20,
              ),
              maxFontSize: 20,
            ),
            const SizedBox(height: 8),
            TextHelper.buildRichText(
              text:
                  'Silahkan cek email Anda, kami sudah mengirim link reset password ke d******do@gmail.com',
              highlight: 'd******do@gmail.com',
              highlightStyle: const TextStyle(
                color: SharedTheme.textBtnColor,
                fontWeight: SharedTheme.bold,
              ),
            ),
            const SizedBox(height: 28),
            Buttons.filled(
              width: double.infinity,
              onPressed: controller.moveToCreateNewPassword,
              child: const Text('Kembali ke login'),
            ),
          ],
        ),
      ),
    );
  }
}
