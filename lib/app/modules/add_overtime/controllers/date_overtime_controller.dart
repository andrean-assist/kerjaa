import 'package:get/get.dart';

class DateOvertimeController extends GetxController {
// Variabel untuk menyimpan bulan yang sedang ditampilkan
  final currentMonth = DateTime.now().obs;

  // Variabel untuk menyimpan tanggal yang dipilih
  final selectedDate = DateTime.now().obs;

  // Fungsi untuk pindah ke bulan sebelumnya
  void previousMonth() {
    currentMonth.value =
        DateTime(currentMonth.value.year, currentMonth.value.month - 1);
  }

  // Fungsi untuk pindah ke bulan berikutnya
  void nextMonth() {
    currentMonth.value =
        DateTime(currentMonth.value.year, currentMonth.value.month + 1);
  }

  // Fungsi untuk mendapatkan daftar hari dalam bulan
  List<DateTime?> getDaysInMonth() {
    final firstDay =
        DateTime(currentMonth.value.year, currentMonth.value.month, 1);
    final lastDay =
        DateTime(currentMonth.value.year, currentMonth.value.month + 1, 0);
    final days = <DateTime?>[];

    // Tambahkan hari kosong di awal bulan
    for (var i = 0; i < firstDay.weekday - 1; i++) {
      days.add(null);
    }

    // Tambahkan hari-hari dalam bulan
    for (var i = 1; i <= lastDay.day; i++) {
      days.add(DateTime(currentMonth.value.year, currentMonth.value.month, i));
    }

    return days;
  }

  // Fungsi untuk memilih tanggal
  void selectDate(DateTime date) {
    selectedDate.value = date;
  }
}
