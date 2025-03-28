import 'package:assist_hadir/app/modules/init/controllers/init_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddLeaveController extends GetxController {
  late final InitController _initC;

  final formKey = GlobalKey<FormState>();
  final leaveTypeC = TextEditingController();
  final leavePeriodStartDateC = TextEditingController();
  final leavePeriodEndDateC = TextEditingController();
  final reasonC = TextEditingController();
  final delegationC = TextEditingController();

  final leaveTypeF = FocusNode();
  final reasonF = FocusNode();
  final delegationF = FocusNode();

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

  // periode cuti
  final focusedDay = Rxn<DateTime>();

  final leavePeriodStartDate = Rxn<DateTime>();
  final leavePeriodEndDate = Rxn<DateTime>();

  // tipe cuti
  final selectedLeaveType = RxnInt();

  final file = Rxn<PlatformFile>();

  final listRequest = [
    'Cuti tahunan',
    'Cuti melahirkan',
    'Cuti keguguran',
    'Cuti pernikahan',
    'Cuti kematiaan',
  ];

  final listType = ['Sehari penuh', 'Setengah hari', 'Per-jam'];

  final isShowModalLeaveType = false.obs;

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

  void confirm() {}

  confirmDate(bool isEndDate) {}
}
