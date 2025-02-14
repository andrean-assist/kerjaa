import 'package:get/get.dart';

import '../../init/controllers/init_controller.dart';

class MainController extends GetxController {
  late final InitController _initC;

  final currentPage = 0.obs;

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

  void changeCurrentPage(int index) => currentPage.value = index;
}
