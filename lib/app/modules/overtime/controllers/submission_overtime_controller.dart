import 'package:assist_hadir/app/modules/init/controllers/init_controller.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SubmissionOvertimeController extends GetxController {
  late final InitController _initC;

  // final filters = [
  //   {
  //     'text': 'Tanggal',
  //   },
  //   {
  //     'text': 'Jenis pengajuan',
  //   },
  //   {
  //     'text': 'Status',
  //   }
  // ];

  final filters = ['Tanggal', 'Jenis pengajuan', 'Status'];

  final selectedFilter = 0.obs;

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

  void setFilter(int? index) => selectedFilter.value = index ?? 0;

  void moveToAddOvertime() => Get.toNamed(Routes.ADD_OVERTIME);
}
