import 'package:get/get.dart';

import '../controllers/add_overtime_controller.dart';

class AddOvertimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddOvertimeController>(
      () => AddOvertimeController(),
    );
  }
}
