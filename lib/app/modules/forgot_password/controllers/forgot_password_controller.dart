import 'package:assist_hadir/app/modules/init/controllers/init_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  late final InitController _initC;

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
