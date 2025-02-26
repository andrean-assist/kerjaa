import 'package:assist_hadir/app/helpers/format_date_time.dart';
import 'package:assist_hadir/app/modules/add_overtime/controllers/add_overtime_controller.dart';
import 'package:assist_hadir/shared/shared_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../widgets/buttons/buttons.dart';

class DateOvertimeModal extends GetView<AddOvertimeController> {
  final bool isTimeOff;

  const DateOvertimeModal(this.isTimeOff, {super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tanggal lembur',
          style: textTheme.titleLarge?.copyWith(
            fontSize: 18,
            fontWeight: SharedTheme.semiBold,
          ),
        ),
        const SizedBox(height: 20),
        Obx(
          () {
            return TableCalendar(
              firstDay: DateTime.now(),
              lastDay: DateTime(2100),
              focusedDay: controller.focusedDay.value,
              // focusedDay: controller.overtimeOffDate.value ?? isTimeOff
              //     ? controller.overtimeOffDate.value ??
              //         controller.currentMonth.value
              //     : controller.overtimeDate.value ??
              //         controller.currentMonth.value,
              // currentDay: isTimeOff
              //     ? controller.overtimeOffDate.value ?? DateTime.now()
              //     : controller.overtimeDate.value ?? DateTime.now(),
              calendarBuilders: CalendarBuilders(
                headerTitleBuilder: (context, day) {
                  return Row(
                    children: [
                      Text(
                        FormatDateTime.dateToString(
                          newPattern: 'EEEE, dd MMMM yyyy',
                          value: day.toIso8601String(),
                        ),
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: SharedTheme.bold,
                          color: SharedTheme.quertenaryTextColor,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: controller.previousMonth,
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
                isTimeOff
                    ? controller.overtimeOffDate.value
                    : controller.overtimeDate.value,
              ),
              onDaySelected: (selectedDay, focusedDay) {
                controller.selectedDate(selectedDay, isTimeOff);
              },
            );
          },
        ),
        const SizedBox(height: 12),
        const Divider(),
        const SizedBox(height: 16),
        Buttons.filled(
          width: double.infinity,
          onPressed: () {},
          child: const Text('Konfirmasi'),
        ),
        const Divider(height: 36),
      ],
    );
  }
}
