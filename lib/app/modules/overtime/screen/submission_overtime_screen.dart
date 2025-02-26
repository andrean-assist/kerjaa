import 'package:assist_hadir/utils/constants_assets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/shared_theme.dart';
import '../../activity_history/widgets/modals/custom_date_activity_history_modal.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/modal/modals.dart';
import '../controllers/submission_overtime_controller.dart';

class SubmissionOvertimeScreen extends GetView<SubmissionOvertimeController> {
  const SubmissionOvertimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        flexibleSpace: _builderFilterChips(context),
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
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Buttons.filled(
            width: double.infinity,
            onPressed: controller.moveToAddOvertime,
            child: const Text('Pengajuan Lembur'),
          ),
        )
      ],
    );
  }

  Widget _builderFilterChips(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: controller.filters
            .map((e) => _builderItemChip(context: context, text: e))
            .toList(),
      ),
    );
  }

  Widget _builderItemChip({
    required BuildContext context,
    required String text,
  }) {
    final index = controller.filters.indexOf(text);
    return Container(
      margin: EdgeInsets.only(
        left: (index == 0) ? 12 : 0,
        right: 12,
      ),
      child: Obx(
        () {
          final selectedFilter = controller.selectedFilter.value;
          final isSelected = index == selectedFilter;

          return InputChip(
            label: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            selected: isSelected,
            color: WidgetStatePropertyAll(
              isSelected ? const Color(0xFFEBF5FB) : SharedTheme.whiteColor,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: isSelected
                    ? const Color(0xFFCBD5E1)
                    : const Color(0xFFE2E8F0),
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            deleteIcon: const Icon(Icons.keyboard_arrow_down_rounded),
            onSelected: (_) async {
              controller.setFilter(index);

              if (index == 2) {
                _showModal(context);
              }
            },
            onDeleted: () {},
            showCheckmark: false,
          );
        },
      ),
    );
  }

  void _showModal(BuildContext context) {
    Modals.bottomSheetWithClose(
      context: context,
      enableDrag: true,
      isDismissible: false,
      content: const CustomDateActivityHistoryModal(),
    );
  }
}
