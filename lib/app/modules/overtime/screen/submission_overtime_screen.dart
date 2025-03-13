import 'package:assist_hadir/utils/constants_assets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/shared_theme.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/chip/builder_filter_chips.dart';
import '../controllers/submission_overtime_controller.dart';

class SubmissionOvertimeScreen extends GetView<SubmissionOvertimeController> {
  const SubmissionOvertimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        flexibleSpace: BuilderFilterChips(controller.filters),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Image.asset(
                  ConstantsAssets.imgSubmissionOvertime,
                ),
              ),
              const SizedBox(height: 24),
              AutoSizeText(
                'Belum ada pengajuaan lembur',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: SharedTheme.bold,
                  color: SharedTheme.primaryTextColor,
                ),
                maxFontSize: 16,
              ),
              const SizedBox(height: 4),
              AutoSizeText(
                'Anda belum ada melakukan pengajuan lembur, nanti kalau ada bakalan tampil disini ya.',
                style: textTheme.bodySmall?.copyWith(
                  fontWeight: SharedTheme.medium,
                  color: SharedTheme.quertenaryTextColor,
                ),
                textAlign: TextAlign.center,
                maxFontSize: 12,
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Buttons.filled(
            width: double.infinity,
            onPressed: controller.moveToAddOvertime,
            child: const Text('Pengajuan Lembur'),
          ),
        )
      ],
    );
  }
}
