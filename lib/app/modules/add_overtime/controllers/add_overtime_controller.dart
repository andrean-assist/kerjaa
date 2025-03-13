import 'package:assist_hadir/app/modules/init/controllers/init_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/constants_assets.dart';

class AddOvertimeController extends GetxController {
  late final InitController _initC;

  final formKey = GlobalKey<FormState>();
  final reasonC = TextEditingController();
  final reasonF = FocusNode();

  static final now = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  final lastDate = now.copyWith(
    day: DateTime(now.year, now.month + 1, 0).day,
    month: 12,
    year: now.year + 50,
  );

  DateTime get dateNow => now;

  // jadwal lembur
  final focusedDay = Rxn<DateTime>();
  final selectedDate = Rxn<DateTime>();
  final overtimeStartDate = Rxn<DateTime>();
  final overtimeEndDate = Rxn<DateTime>();

  // tipe lembur
  final selectedOvertimeType = RxnInt();

  // shift
  final selectedShift = RxnInt();

  final beforeShift = false.obs;
  final afterShift = false.obs;

  final file = Rxn<PlatformFile>();

  final listOvertimeType = [
    {
      'title': 'Lembur',
      'icon': ConstantsAssets.icPaid,
    },
    {
      'title': 'Tidak Dibayar',
      'icon': ConstantsAssets.icNotPaid,
    },
    {
      'title': 'Dihari Libur',
      'icon': ConstantsAssets.icOnHolidays,
    },
  ];

  final listShift = [
    {
      'title': 'Shift pagi',
      'subtitle': '08:00 - 17:00',
      'icon': ConstantsAssets.icMorningShift,
    },
    {
      'title': 'Shift malam',
      'subtitle': '17:00 - 02:00',
      'icon': ConstantsAssets.icNightShift,
    },
  ];

  final indexScreenOvertime = 0.obs;

  // final currentBreakDuration = (-1).obs;

  // final listBreakDuration = ['0 Menit', '20 Menit', '30 Menit', 'Lainnya'];

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }
  }

  void setBeforeShift(bool state) => beforeShift.value = state;

  void setAfterShift(bool state) => afterShift.value = state;

  // void changeCurrentBreakDuration(int index) =>
  //     currentBreakDuration.value = index;

  Future<void> confirm() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(Get.context!).unfocus();
    _submitForm();
  }

  void _submitForm() {}

  void confirmDate(bool isUpdate) {
    if (indexScreenOvertime.value == 0) {
      overtimeStartDate.value = selectedDate.value;
      overtimeEndDate.value = null;
      indexScreenOvertime.value++;
    } else {
      overtimeEndDate.value = selectedDate.value;
      _closeModal();
    }

    selectedDate.value = null;
  }

  void _closeModal() => Get.back();

  void onSelectedDate(DateTime selectedDay) {
    selectedDate.value = selectedDay;
    focusedDay.value = selectedDay;
  }

  bool isPreviousButtonEnabled() {
    return focusedDay.value?.month != now.month ||
        focusedDay.value?.year != now.year;
  }

  void previousMonth() {
    if (focusedDay.value != null) {
      final previousDay = DateTime(
        focusedDay.value!.year,
        focusedDay.value!.month - 1,
      );

      if (previousDay.isAfter(now)) {
        focusedDay.value = previousDay;
      } else {
        focusedDay.value = now;
      }
    }
  }

  void nextMonth() {
    focusedDay.value = focusedDay.value?.copyWith(
          month: focusedDay.value!.month + 1,
          day: 1,
        ) ??
        now.copyWith(
          month: now.month + 1,
          day: 1,
        );
  }

  Future<void> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowedExtensions: ['pdf'],
        type: FileType.custom,
      );
      if (result != null) {
        file.value = result.files.first;

        // tampilkan banners

        // ScaffoldMessenger.of(Get.context!).showMaterialBanner(
        //   MaterialBanner(
        //     leading: SvgPicture.asset(
        //       ConstantsAssets.icFolder,
        //       width: 28,
        //       height: 28,
        //     ),
        //     content: Column(),
        //     actions: [
        //       const SizedBox(),
        //     ],
        //   ),
        // );

        Get.back();
      }
    } catch (e) {
      _initC.logger.e('Error: $e');
    }
  }
}
