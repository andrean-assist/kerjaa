import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class TimeHelper {
  static Stream<DateTime> streamDateTime() {
    return Stream.periodic(1.seconds, (_) => DateTime.now());
  }

  static Stream<TimeOfDay> streamTime() {
    return Stream.periodic(1.seconds, (_) => TimeOfDay.now());
  }

  static Stream<Duration> streamDiffDuration(DateTime startTime
      // required DateTime endTime,
      ) {
    return Stream.periodic(
      1.seconds,
      (_) => DateTime.now().difference(startTime),
    );
  }

  // Fungsi untuk mengecek apakah waktu saat ini berada dalam rentang tertentu
  static bool isWithinRange(
    DateTime now,
    int startHour,
    int startMinute,
    int endHour,
    int endMinute,
  ) {
    final startTime =
        DateTime(now.year, now.month, now.day, startHour, startMinute);
    final endTime = DateTime(now.year, now.month, now.day, endHour, endMinute);
    return now.isAfter(startTime) && now.isBefore(endTime);
  }

  static DateTime? stringToDateTime(String value) {
    return DateTime.tryParse(value);
  }
}
