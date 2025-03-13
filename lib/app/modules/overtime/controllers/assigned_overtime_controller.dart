import 'package:assist_hadir/app/data/model/events/events_model.dart';
import 'package:get/get.dart';

import '../../init/controllers/init_controller.dart';

class AssignedOvertimeController extends GetxController {
  late final InitController _initC;

  final filters = ['Tanggal', 'Jenis pengajuan', 'Status'];

  final events = [
    EventsModel(
      eventType: 'nightShift',
      eventTime: DateTime.now().toIso8601String(),
      approved: 'valid',
    )
  ];

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
}
