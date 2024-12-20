import 'package:assist_hadir/shared/shared_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants_assets.dart';

class NoAccessCameraModal extends StatelessWidget {
  const NoAccessCameraModal({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            ConstantsAssets.imgNoAccessCamera,
            height: 250,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 24),
          Text(
            'Aktifkan izin kamera hp Anda dulu ya!',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: SharedTheme.semiBold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            'Untuk dapat menggunakan fitur absensi, aktifkan izin kamera hp Anda dulu ya.',
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: SharedTheme.medium,
              color: theme.hintColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
