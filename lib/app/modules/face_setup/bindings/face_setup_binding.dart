import 'package:get/get.dart';

import '../controllers/face_setup_controller.dart';

class FaceSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaceSetupController>(
      () => FaceSetupController(),
    );
  }
}
