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

    // _initC.localStorage
    //   ..write(ConstantsKeys.authToken, 'testing')
    //   ..write(ConstantsKeys.userId, '673d669654bb7810dc2f32bd')
    //   ..write(ConstantsKeys.organizationId, '67455049f7b139bd81ecc42f')
    //   ..write(ConstantsKeys.isVerified, true);

    // _initC.localStorage.remove(ConstantsKeys.startTimeWork);
    // _initC.localStorage.remove(ConstantsKeys.restStartTime);
    // _initC.localStorage.remove(ConstantsKeys.restEndTime);

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
          _moveToHome();
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

  void _moveToHome() => Get.offAllNamed(Routes.HOME);

  void _moveToFaceSetup() => Get.offAllNamed(
        Routes.REGISTER_FACE,
        arguments: const NavigationModel(
          absenceType: StatusAbsenceSetup.register,
        ),
      );
}
