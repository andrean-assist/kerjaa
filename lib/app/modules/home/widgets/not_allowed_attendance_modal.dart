import 'package:assist_hadir/shared/shared_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants_assets.dart';

class NotAllowedAttendanceModal extends StatelessWidget {
  const NotAllowedAttendanceModal({super.key});

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
            ConstantsAssets.imgNotAllowedAttendance,
            height: 250,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 24),
          Text(
            'Opps.. Anda tidak bisa menggunakan absen mobile di hari ini!',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: SharedTheme.semiBold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            'Karena di awal Anda absen di Website, untuk saat ini hanya bisa istirahat dan checkout di Website ya.',
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
