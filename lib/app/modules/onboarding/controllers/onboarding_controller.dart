import 'package:assist_hadir/utils/constants_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../init/controllers/init_controller.dart';

class OnboardingController extends GetxController {
  late final InitController _initC;
  late final PageController pageC;

  final currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() async {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    pageC = PageController();
    pageC.addListener(_setCurrentPage);
  }

  void _setCurrentPage() {
    currentPage.value = pageC.page?.toInt() ?? 0;
  }

  Future<void> moveToNextPage() async {
    if (currentPage.value < (ConstantsStrings.onboardingList.length - 1)) {
      currentPage.value++;
      await pageC.nextPage(
        duration: Durations.long1,
        curve: Curves.easeIn,
      );
    } else {
      await _initC.updateOnboarding();
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  @override
  void onClose() {
    pageC.dispose();
    super.onClose();
  }
}
