import 'package:get/get.dart';

import '../controllers/check_email_controller.dart';

class CheckEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckEmailController>(
      () => CheckEmailController(),
    );
  }
}
