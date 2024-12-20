import 'package:assist_hadir/app/helpers/format_date_time.dart';
import 'package:assist_hadir/app/modules/activity_history/controllers/activity_history_controller.dart';
import 'package:assist_hadir/app/modules/widgets/textform_fields/custom_textform_field.dart';
import 'package:assist_hadir/shared/shared_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/buttons/buttons.dart';

class CustomDateActivityHistoryModal
    extends GetView<ActivityHistoryController> {
  const CustomDateActivityHistoryModal({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Kapan Periode Aktivitas nya?',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: SharedTheme.semiBold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 21),
          Obx(() {
            final now = DateTime.now();

            return Column(
              children: controller.filters.map((e) {
                final index = controller.filters.indexOf(e);
                var title = '';
                dynamic subtitle = '';

                switch (index) {
                  case 0:
                    title = e;
                    subtitle = FormatDateTime.dateToString(
                      newPattern: 'EEE, dd MMM yyyy',
                      value: now.toString(),
                    );
                    break;
                  case 1:
                    title = '$e terakhir';
                    subtitle = '${FormatDateTime.dateToString(
                      newPattern: 'EEE, dd MMM yyyy',
                      value: now.subtract(7.days).toString(),
                    )} - ${FormatDateTime.dateToString(
                      newPattern: 'EEE, dd MMM yyyy',
                      value: now.toString(),
                    )}';
                    break;
                  case 2:
                    title = 'Bulan ini';
                    subtitle = '${FormatDateTime.dateToString(
                      newPattern: 'EEE, dd MMM yyyy',
                      value: DateTime(now.year, now.month, 1).toString(),
                    )} - ${FormatDateTime.dateToString(
                      newPattern: 'EEE, dd MMM yyyy',
                      value: DateTime(now.year, now.month + 1, 0).toString(),
                    )}';
                  case 3:
                    title = 'Pilih Tanggal Lain';
                    subtitle = Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            controller: controller.fromDateC,
                            title: 'Dari',
                            isFilled: false,
                            isDense: true,
                            style: textTheme.bodyMedium,
                            isReadOnly: true,
                            keyboardType: TextInputType.datetime,
                            onTap: () => _showDateRangePicker(context),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CustomTextFormField(
                            controller: controller.toDateC,
                            title: 'Sampai',
                            isFilled: false,
                            isDense: true,
                            style: textTheme.bodyMedium,
                            isReadOnly: true,
                            keyboardType: TextInputType.datetime,
                            onTap: () => _showDateRangePicker(context),
                          ),
                        ),
                      ],
                    );
                    break;
                  default:
                }

                return _builderItem(
                  textTheme: textTheme,
                  index: index,
                  title: title,
                  subtitle: subtitle,
                  onChanged: (int? value) =>
                      controller.selectedCustomDateFilter.value = value ?? 0,
                );
              }).toList(),
            );
          }),
          const SizedBox(height: 21),
          _builderActions(),
        ],
      ),
    );
  }

  void _showDateRangePicker(BuildContext context) async {
    final now = DateTime.now();
    final dateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(1945),
      lastDate: DateTime(now.year, now.month + 1, 0),
      currentDate: now,
    );

    if (dateRange != null) {
      controller.fromDateC.text = FormatDateTime.dateToString(
        newPattern: 'EEE, dd MMM yyyy',
        value: dateRange.start.toString(),
      );
      controller.toDateC.text = FormatDateTime.dateToString(
        newPattern: 'EEE, dd MMM yyyy',
        value: dateRange.end.toString(),
      );
    }
  }

  Widget _builderItem({
    required TextTheme textTheme,
    required int index,
    required String title,
    required dynamic subtitle,
    required void Function(int? value) onChanged,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RadioListTile(
          value: index,
          groupValue: controller.selectedCustomDateFilter.value,
          onChanged: onChanged,
          title: Text(
            title,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: SharedTheme.semiBold,
            ),
          ),
          subtitle: (subtitle is String)
              ? Text(
                  subtitle,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: SharedTheme.medium,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.trailing,
        ),
        (subtitle is Widget) ? subtitle : const SizedBox.shrink(),
      ],
    );
  }

  Widget _builderActions() {
    return Row(
      children: [
        Expanded(
          child: Buttons.filledTonal(
            onPressed: Get.back,
            child: const Text('Batal'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Buttons.filled(
            onPressed: () {
              controller
                  .fetchHistory(controller.selectedCustomDateFilter.value);
              Get.back();
            },
            child: const Text('Pilih'),
          ),
        ),
      ],
    );
  }
}
