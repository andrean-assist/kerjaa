import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormatDateTime {
  static String dateToString({
    bool isIndonesian = true,
    String? oldPattern,
    required String newPattern,
    required String? value,
    String? defaultOutput,
  }) {
    if (value == null) return defaultOutput ?? '-';

    DateTime inputDate;

    if (oldPattern != null) {
      String? locale;

      if (isIndonesian) {
        locale = 'id_ID';
      }

      final inputFormat = DateFormat(oldPattern, locale);
      inputDate = inputFormat.parse(value);
    } else {
      inputDate = DateTime.parse(value);
    }

    // check is UTC format
    if (inputDate.isUtc) {
      inputDate = inputDate.add(const Duration(hours: 7));
    }

    final outputFormat = DateFormat(newPattern, 'id_ID');
    return outputFormat.format(inputDate);
  }

  static DateTime? iso8601ToDateTime({
    String? pattern,
    String? value,
  }) {
    if (value == null) return null;
    if (pattern != null) {
      final outputFormat = DateFormat(pattern, 'id_ID');
      return outputFormat.tryParse(value);
    }
    return DateTime.tryParse(value);
  }

  static String? iso8601ToString({
    required String pattern,
    required String? value,
  }) {
    if (value == null) return null;
    final outputFormat = DateFormat(pattern, 'id_ID');
    return outputFormat.parse(value).toString();
  }

  static DateTime? stringToDateTime({
    String? oldPattern,
    required String newPattern,
    required String? value,
  }) {
    if (value == null) return null;

    DateTime inputDate;

    if (oldPattern != null) {
      final inputFormat = DateFormat(oldPattern, 'id_ID');
      inputDate = inputFormat.parse(value);
    } else {
      inputDate = DateTime.parse(value);
    }

    return inputDate;
  }

  static String timeToString({
    required String newPattern,
    required TimeOfDay value,
  }) {
    final outputFormat = DateFormat(newPattern, 'id_ID');
    final outputTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      value.hour,
      value.minute,
    );
    return outputFormat.format(outputTime);
  }

  static String time({
    required int? value,
    bool isOnlyHour = false,
    bool isOnlyMinute = false,
  }) {
    if (value == null) return '-';

    final padTime = switch (value.toString().length) {
      1 => '000$value',
      2 => '00$value',
      3 => '0$value',
      _ => '$value',
    };

    final hour = padTime.substring(0, 2);
    final minute = padTime.substring(2, 4);

    if (isOnlyHour) {
      return hour;
    }

    if (isOnlyMinute) {
      return minute;
    }

    return "$hour:$minute";
  }

  static int convertTimeToInt(String value) {
    if (value.contains(':')) {
      final time = value.replaceAll(':', '');
      final result = int.parse(time);
      return result;
    }
    return 0;
  }

  static TimeOfDay intToTime(int value) {
    final hour = int.tryParse(time(value: value, isOnlyHour: true)) ?? 0;
    final minute = int.tryParse(time(value: value, isOnlyMinute: true)) ?? 0;
    return TimeOfDay(hour: hour, minute: minute);
  }

  static String durationToString(Duration? duration) {
    if (duration == null) return '--:--:--';
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }
}
