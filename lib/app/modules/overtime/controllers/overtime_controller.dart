import 'package:assist_hadir/app/modules/init/controllers/init_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OvertimeController extends GetxController
    with GetTickerProviderStateMixin {
  late final InitController _initC;
  late final TabController tabC;

  final currentScreen = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    // initcontrolelr
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    tabC = TabController(length: 2, vsync: this);

    tabC.addListener(() => changeScreen(tabC.index));
  }

  void changeScreen(int index) {
    currentScreen.value = index;
    tabC.animateTo(index);
  }
}
