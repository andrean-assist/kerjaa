import 'dart:io';

import 'package:assist_hadir/app/data/model/auth/login/res/data/data_login_model.dart';
import 'package:assist_hadir/app/data/model/auth/login/req/req_login_model.dart';
import 'package:assist_hadir/app/data/model/auth/login/res/res_login_model.dart';
import 'package:assist_hadir/app/modules/init/controllers/init_controller.dart';
import 'package:assist_hadir/app/helpers/logger_helper.dart';
import 'package:assist_hadir/shared/shared_enum.dart';
import 'package:assist_hadir/utils/constants_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

import '../../../../services/auth/auth_services.dart';
import '../../../data/model/navigations/navigation_model.dart';
import '../../../routes/app_pages.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/modal/modals.dart';
import '../widget/modal/failed_login_modal.dart';

class LoginController extends GetxController {
  late final InitController _initC;
  late final AuthServices _authS;

  // static const emailDummy = 'reza.febriyan@assist.id';
  // static const passwordDummy = '12345678';

  final formKey = GlobalKey<FormState>();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  final emailF = FocusNode();
  final passwordF = FocusNode();

  final email = ''.obs;
  final password = ''.obs;

  final isVisiblePassword = false.obs;
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

    _authS = AuthServices(_initC);

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

  Future<void> confirm() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(Get.context!).unfocus();
    _checkAuth();
  }

  void _checkAuth() async {
    isLoading.value = true;

    final reqLogin = ReqLoginModel(
      email: emailC.text.trim().toString(),
      password: passwordC.text.trim().toString(),
    );

    try {
      final res = await _authS.login(reqLogin.toJson());

      print('res isOk = ${res.isOk}');

      if (res.isOk) {
        final body = res.body;

        if (body != null) {
          final resLogin = ResLoginModel.fromJson(body);
          final dataLogin = resLogin.data;
          final isHasRegisteredFace = dataLogin?.user?.isVerified ?? false;

          // save to storage
          if (dataLogin != null) {
            await _saveUserLogin(dataLogin);

            if (isHasRegisteredFace) {
              _moveToMain();
            } else {
              _moveToFaceSetup();
            }
          }
        }
      } else {
        if (!_initC.isConnectedInternet.value) {
          _initC.showModalDisconnected();
        } else {
          if (res.statusCode == HttpStatus.unauthorized) {
            _showDialogWrongEmailOrPassword();
          } else {
            _initC.showDialogFailed(
              onPressed: () {
                _checkAuth();
                Get.back();
              },
            );
          }
        }
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: checkAuth $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _saveUserLogin(DataLoginModel data) async {
    LoggerHelper.printPrettyJson(data.toJson());

    final user = data.user;
    final token = data.id;
    final organizationId = user?.organizationId;
    final isVerified = user?.isVerified ?? false;
    final name = user?.name;
    final position = user?.position;
    final avatar = user?.avatar;

    _initC.localStorage
      ..write(ConstantsKeys.authToken, token)
      ..write(ConstantsKeys.userId, user?.id)
      ..write(ConstantsKeys.name, name)
      ..write(ConstantsKeys.email, email.value)
      ..write(ConstantsKeys.position, position)
      ..write(ConstantsKeys.profilPicture, avatar)
      ..write(ConstantsKeys.organizationId, organizationId)
      ..write(ConstantsKeys.isVerified, isVerified);
  }

  void _showDialogWrongEmailOrPassword() {
    Modals.bottomSheetWithClose(
      context: Get.context!,
      content: const FailedLoginModal(),
      actions: Buttons.filled(
        width: double.infinity,
        onPressed: Get.back,
        child: const Text('Oke, Terima kasih'),
      ),
    );
  }

  void _moveToFaceSetup() => Get.toNamed(
        Routes.REGISTER_FACE,
        arguments: const NavigationModel(
          absenceType: StatusAbsenceSetup.register,
        ),
      );

  void _moveToMain() => Get.offAllNamed(Routes.MAIN);
  void _moveToHome() => Get.offAllNamed(Routes.MAIN);

  void moveToForgotPassword() => Get.toNamed(Routes.FORGOT_PASSWORD);
}
