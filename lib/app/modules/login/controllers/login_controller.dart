import 'package:assist_hadir/app/modules/init/controllers/init_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/modal/modals.dart';
import '../widget/modal/failed_login_modal.dart';

class LoginController extends GetxController {
  late final InitController _initC;

  final formKey = GlobalKey<FormState>();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  final emailF = FocusNode();
  final passwordF = FocusNode();

  final email = ''.obs;
  final password = ''.obs;

  final isVisiblePassword = false.obs;
  final isLoading = false.obs;

  final errMsg = RxnString();

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
    _setListener(obs: email, ctr: emailC);
    _setListener(obs: password, ctr: passwordC);
  }

  void _setListener({
    required Rx obs,
    required TextEditingController ctr,
  }) =>
      ctr.addListener(() => obs.value = ctr.text);

  void confirm() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(Get.context!).unfocus();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    clearError();
    isLoading.value = true;
    await Future.delayed(3.seconds);

    if (emailC.text == 'andrean.ramadhan@assist.id' &&
        passwordC.text == '12345678') {
      _moveToFaceSetup();
    } else {
      _showDialog();
    }

    isLoading.value = false;
  }

  void _showDialog() {
    Modals.bottomSheet(
      context: Get.context!,
      content: const FailedLoginModal(),
      actions: Buttons.filled(
        width: double.infinity,
        onPressed: Get.back,
        child: const Text('Oke, Terima kasih'),
      ),
    );
  }

  void clearError() => errMsg.value = null;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _moveToFaceSetup() => Get.toNamed(Routes.FACE_SETUP);
}
