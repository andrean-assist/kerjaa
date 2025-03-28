import 'package:assist_hadir/app/helpers/format_date_time.dart';
import 'package:assist_hadir/shared/shared_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../widgets/buttons/buttons.dart';
import '../../controllers/add_leave_controller.dart';

class DateLeavePeriodModal extends GetView<AddLeaveController> {
  final bool isEndDate;

  const DateLeavePeriodModal(this.isEndDate, {super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

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
            onPressed: (isEndDate)
                ? controller.leavePeriodEndDate.value != null
                    ? controller.confirmDate(isEndDate)
                    : null
                : controller.leavePeriodStartDate.value != null
                    ? controller.confirmDate(isEndDate)
                    : null,
            child: Text(isEndDate ? 'Konfirmasi Akhir' : 'Konfirmasi Awal'),
          ),
          const Divider(height: 36),
        ],
      ),
    );
  }

  Widget _builderTitleModal(TextTheme textTheme) {
    final title = isEndDate ? 'time off' : 'start off';

    return Text(
      'Tanggal $title',
      style: textTheme.titleLarge?.copyWith(
        fontSize: 18,
        fontWeight: SharedTheme.semiBold,
      ),
    );
  }

  Widget _builderTableCalendar(TextTheme textTheme) {
    final date = isEndDate
        ? (
            controller.leavePeriodStartDate.value ?? controller.dateNow,
            controller.leavePeriodEndDate.value,
          )
        : (controller.dateNow, controller.leavePeriodStartDate.value);

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
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        selectedDecoration: BoxDecoration(
          color: isEndDate
              ? SharedTheme.secondaryBtnColor
              : SharedTheme.filledBtnColor,
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
