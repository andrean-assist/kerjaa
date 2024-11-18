import 'package:assist_hadir/shared/shared_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants_assets.dart';

class FailedLoginModal extends StatelessWidget {
  const FailedLoginModal({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = context.mediaQuerySize;
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            ConstantsAssets.imgLoginFailed,
            height: 250,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 24),
          Text(
            'Pastiin email dan kata sandi Anda benar',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: SharedTheme.semiBold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            'Email dan kata sandi Anda tidak benar, periksa kembali dan lalu coba lagi.',
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: SharedTheme.semiBold,
              color: theme.hintColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
