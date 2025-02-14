import 'package:assist_hadir/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    // Get.lazyPut<MainController>(() => MainController());
    Get.put(HomeController());
    // Get.lazyPut<HomeController>(() => HomeController());
  }
}
