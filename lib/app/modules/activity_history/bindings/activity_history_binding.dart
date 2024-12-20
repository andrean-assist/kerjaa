import 'package:get/get.dart';

import '../controllers/activity_history_controller.dart';

class ActivityHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivityHistoryController>(() => ActivityHistoryController());
  }
}
