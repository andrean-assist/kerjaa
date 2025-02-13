import 'package:assist_hadir/app/modules/init/controllers/init_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class ForgotPasswordController extends GetxController {
  late final InitController _initC;

  final formKey = GlobalKey<FormState>();
  final emailC = TextEditingController();

  final email = ''.obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    _initListener();
  }

  void _initListener() {
    emailC.addListener(_setEmail);
  }

  void _setEmail() => email.value = emailC.text;

  void moveToCheckEmail() => Get.toNamed(Routes.CHECK_EMAIL);
}
