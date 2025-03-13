import 'package:assist_hadir/app/data/db/main_menu/main_menu_db.dart';
import 'package:assist_hadir/utils/constants_assets.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class MainController extends GetxController {
  final currentPage = 0.obs;

  final listMainMenu = [
    MainMenuDB(
      iconPath: ConstantsAssets.icHomeNavbar,
      label: 'Home',
      onPressed: () {},
    ),
    MainMenuDB(
      iconPath: ConstantsAssets.icEmployeeNavbar,
      label: 'Karyawan',
      onPressed: () {},
    ),
    MainMenuDB(
      iconPath: ConstantsAssets.icMessageNavbar,
      label: 'Pesan',
      onPressed: () {},
    ),
    MainMenuDB(
      iconPath: ConstantsAssets.icProfileNavbar,
      label: 'Profile',
      onPressed: () {},
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {}

  void changeCurrentPage(int index) {
    currentPage.value = index;
  }

  void leaveApplication() => Get.toNamed(Routes.LEAVE);
}
