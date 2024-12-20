import 'package:assist_hadir/app/data/model/user/user_model.dart';
import 'package:get/get.dart';

import '../../../../utils/constants_keys.dart';
import '../../../routes/app_pages.dart';
import '../../init/controllers/init_controller.dart';
import '../../widgets/dialog/dialogs.dart';

class ProfileController extends GetxController {
  late final InitController _initC;

  String? fullName;
  String? email;
  String? position;
  String? profilePicture;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    _prepareStorage();
  }

  void _prepareStorage() {
    fullName = _initC.localStorage.read(ConstantsKeys.name);
    email = _initC.localStorage.read(ConstantsKeys.email);
    position = _initC.localStorage.read(ConstantsKeys.position);
    profilePicture = _initC.localStorage.read(ConstantsKeys.profilPicture);

    print('email = $email');
    print('position = $position');
    print('profilePicture = $profilePicture');
  }

  void moveToActivityHistory() => Get.toNamed(Routes.ACTIVITY_HISTORY);

  Future<void> logout() async {
    final result = await Dialogs.logout(
      context: Get.context!,
      initC: _initC,
    );

    if (result != null) {
      if (result) {
        await _initC.localStorage.erase();
        await _initC.localStorage.write(ConstantsKeys.isFirstUsingApp, false);
        Get.offAllNamed(Routes.LOGIN);
      }
    }
  }

  void moveToEditProfile() => Get.toNamed(
        Routes.EDIT_PROFILE,
        arguments: UserModel(
          name: fullName,
          email: email,
          avatar: profilePicture,
          position: position,
        ),
      );
}
