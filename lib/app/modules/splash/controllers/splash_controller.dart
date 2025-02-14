import 'dart:async';

import 'package:assist_hadir/app/data/model/navigations/navigation_model.dart';
import 'package:assist_hadir/utils/constants_keys.dart';
import 'package:get/get.dart';

import '../../../../shared/shared_enum.dart';
import '../../../routes/app_pages.dart';
import '../../init/controllers/init_controller.dart';

class SplashController extends GetxController {
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

    Future.delayed(5.seconds, _checkAuth);
  }

  void _checkAuth() {
    final token = _initC.localStorage.read<String>(ConstantsKeys.authToken);
    final isHasRegisteredFace =
        _initC.localStorage.read<bool>(ConstantsKeys.isVerified) ?? false;

    if (_initC.isUserFirstUsingApp() ?? true) {
      _moveToOnboarding();
    } else {
      if (token != null) {
        if (isHasRegisteredFace) {
          _moveToMain();
        } else {
          _moveToFaceSetup();
        }
      } else {
        _moveToLogin();
      }
    }
  }

  void _moveToOnboarding() => Get.offAllNamed(Routes.ONBOARDING);

  void _moveToLogin() => Get.offAllNamed(Routes.LOGIN);

  void _moveToMain() => Get.offAllNamed(Routes.MAIN);

  void _moveToFaceSetup() => Get.offAllNamed(
        Routes.REGISTER_FACE,
        arguments: const NavigationModel(
          absenceType: StatusAbsenceSetup.register,
        ),
      );
}
