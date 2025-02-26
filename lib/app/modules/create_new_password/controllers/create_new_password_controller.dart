import 'dart:async';

import 'package:assist_hadir/app/modules/init/controllers/init_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

import '../../../routes/app_pages.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/modal/modals.dart';
import '../widget/modal/create_new_password_success_modal.dart';

class CreateNewPasswordController extends GetxController {
  late final InitController _initC;

  final formKey = GlobalKey<FormState>();
  final passwordC = TextEditingController();
  final repeatPasswordC = TextEditingController();

  final passwordF = FocusNode();
  final repeatPasswordF = FocusNode();

  final password = ''.obs;
  final repeatPassword = ''.obs;
  final passwordV = RxnString();
  final isVisiblePassword = false.obs;
  final isVisibleRepeatPassword = false.obs;

  final isLoading = false.obs;
  final isNotMatch = false.obs;

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
    passwordC.addListener(setPassword);
    repeatPasswordC.addListener(setRepeatPassword);
  }

  void setPassword() {
    password.value = passwordC.text.toString().trim();
  }

  void setRepeatPassword() =>
      repeatPassword.value = repeatPasswordC.text.trim().toString();

  Future<void> resetPassword() async {
    isLoading.value = true;

    try {
      await Future.delayed(3.seconds, _showDialogCreateNewPasswordSuccess);
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: checkAuth $e');
    } finally {
      isLoading.value = false;
    }
  }

  void moveToLogin() => Get.offAllNamed(Routes.LOGIN);

  void _showDialogCreateNewPasswordSuccess() {
    Modals.bottomSheetWithClose(
      context: Get.context!,
      content: const CreateNewPasswordSuccessModal(),
      actions: Buttons.filled(
        width: double.infinity,
        onPressed: moveToLogin,
        child: const Text('Kembali login'),
      ),
    );
  }
}
