import 'dart:async';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../init/controllers/init_controller.dart';

class SplashController extends GetxController {
  late final InitController _initC;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    Future.delayed(
      5.seconds,
      () => _moveToOnboarding(),
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _moveToOnboarding() => Get.offAllNamed(Routes.ONBOARDING);
}
