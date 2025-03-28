import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class CheckEmailController extends GetxController {
  void moveToLogin() => Get.offAllNamed(Routes.LOGIN);

  void moveToCreateNewPassword() => Get.toNamed(Routes.CREATE_NEW_PASSWORD);
}
