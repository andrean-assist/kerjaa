import 'package:assist_hadir/app/helpers/format_date_time.dart';
import 'package:assist_hadir/app/modules/add_overtime/controllers/add_overtime_controller.dart';
import 'package:assist_hadir/shared/shared_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../widgets/buttons/buttons.dart';

class DateOvertimeModal extends GetView<AddOvertimeController> {
  final bool isUpdate;

  const DateOvertimeModal(this.isUpdate, {super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    if (isUpdate) {
      controller.selectedDate.value = controller.overtimeStartDate.value;
    }

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _builderTitleModal(textTheme),
          const SizedBox(height: 20),
          _builderTableCalendar(textTheme),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 16),
          Buttons.filled(
            width: double.infinity,
            onPressed: controller.selectedDate.value != null
                ? () => controller.confirmDate(isUpdate)
                : null,
            child: const Text('Konfirmasi'),
          ),
          const Divider(height: 36),
        ],
      ),
    );
  }

  Widget _builderTitleModal(TextTheme textTheme) {
    final title = switch (isUpdate) {
      true => controller.indexScreenOvertime.value == 0 ? 'lembur' : 'time off',
      false =>
        controller.indexScreenOvertime.value == 0 ? 'time off' : 'lembur',
    };

    return Text(
      'Tanggal $title',
      style: textTheme.titleLarge?.copyWith(
        fontSize: 18,
        fontWeight: SharedTheme.semiBold,
      ),
    );
  }

  Widget _builderTableCalendar(TextTheme textTheme) {
    final date = switch (controller.indexScreenOvertime.value) {
      1 => (
          controller.overtimeStartDate.value ?? controller.dateNow,
          controller.overtimeEndDate.value
        ),
      _ => (controller.dateNow, controller.overtimeStartDate.value),
    };

    return TableCalendar(
      firstDay: date.$1,
      lastDay: controller.lastDate,
      focusedDay: controller.focusedDay.value ?? controller.dateNow,
      calendarBuilders: CalendarBuilders(
        headerTitleBuilder: (context, day) {
          return Row(
            children: [
              Text(
                FormatDateTime.dateToString(
                  newPattern: 'EEEE, dd MMMM yyyy',
                  value: (day.month != controller.selectedDate.value?.month)
                      ? day.toIso8601String()
                      : controller.selectedDate.value?.toIso8601String(),
                ),
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: SharedTheme.bold,
                  color: SharedTheme.quertenaryTextColor,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: controller.isPreviousButtonEnabled()
                    ? controller.previousMonth
                    : null,
                icon: const Icon(
                  Icons.chevron_left_rounded,
                  color: SharedTheme.lightIconColor,
                ),
              ),
              IconButton(
                onPressed: controller.nextMonth,
                icon: const Icon(
                  Icons.chevron_right_rounded,
                  color: SharedTheme.lightIconColor,
                ),
              ),
            ],
          );
        },
      ),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        leftChevronVisible: false,
        rightChevronVisible: false,
      ),
      calendarStyle: const CalendarStyle(
        isTodayHighlighted: false,
        selectedDecoration: BoxDecoration(
          color: SharedTheme.filledBtnColor,
          shape: BoxShape.circle,
        ),
      ),
      selectedDayPredicate: (day) => isSameDay(
        day,
        isUpdate && controller.selectedDate.value == null
            ? date.$2
            : controller.selectedDate.value,
      ),
      onDaySelected: (selectedDay, focusedDay) {
        controller.onSelectedDate(selectedDay);
      },
    );
  }
}
