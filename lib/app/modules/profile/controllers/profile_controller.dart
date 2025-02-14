import 'package:assist_hadir/app/data/model/user/user_model.dart';
import 'package:get/get.dart';

import '../../../../utils/constants_keys.dart';
import '../../../routes/app_pages.dart';
import '../../init/controllers/init_controller.dart';
import '../../widgets/dialog/dialogs.dart';

class ProfileController extends GetxController {
  late final InitController _initC;

  final fullName = RxnString();
  final email = RxnString();
  final position = RxnString();
  final profilePicture = RxnString();

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
    fullName.value = _initC.localStorage.read(ConstantsKeys.name);
    email.value = _initC.localStorage.read(ConstantsKeys.email);
    position.value = _initC.localStorage.read(ConstantsKeys.position);
    // profilePicture.value =
    //     _initC.localStorage.read(ConstantsKeys.profilPicture);
  }

  void moveToActivityHistory() => Get.toNamed(Routes.ACTIVITY_HISTORY);

  Future<void> moveToEditProfile() async {
    final state = await Get.toNamed(
      Routes.EDIT_PROFILE,
      arguments: UserModel(
        name: fullName.value,
        email: email.value,
        avatar: profilePicture.value,
        position: position.value,
      ),
    );

    if (state != null) {
      if (state) {
        _prepareStorage();
      }
    }
  }

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
}
