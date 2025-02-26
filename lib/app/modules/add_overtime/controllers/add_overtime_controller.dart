import 'package:assist_hadir/app/modules/init/controllers/init_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddOvertimeController extends GetxController {
  late final InitController _initC;

  final formKey = GlobalKey<FormState>();
  final reasonC = TextEditingController();
  final reasonF = FocusNode();

  final focusedDay = DateTime.now().obs;

  final overtimeDate = Rxn<DateTime>();
  final overtimeOffDate = Rxn<DateTime>();

  final beforeShift = false.obs;
  final afterShift = false.obs;

  final currentMonth = DateTime.now().obs;

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

  void selectedDate(DateTime selectedDay, bool isTimeOff) {
    if (isTimeOff) {
      overtimeOffDate.value = selectedDay;
    } else {
      overtimeDate.value = selectedDay;
    }
  }

  void previousMonth() {
    final now = DateTime.now();
    if (focusedDay.value.isAfter(now)) {
      focusedDay.value = DateTime(
        focusedDay.value.year,
        focusedDay.value.month - 1,
      );
    } else {
      focusedDay.value = now;
    }

    // if (currentMonth.value.month < DagteTime.now().month) {
    //   currentMonth.value = DateTime(
    //     currentMonth.value.year,
    //     currentMonth.value.month - 1,
    //   );
    // } else {
    //   currentMonth.value = DateTime.now();
    // }
  }

  void nextMonth() {
    focusedDay.value = DateTime(
      currentMonth.value.year,
      currentMonth.value.month + 1,
    );
  }
}
