import 'package:assist_hadir/app/data/db/main_menu/main_menu_db.dart';
import 'package:assist_hadir/app/modules/home/controllers/home_controller.dart';
import 'package:assist_hadir/app/modules/profile/controllers/profile_controller.dart';
import 'package:assist_hadir/utils/constants_assets.dart';
import 'package:get/get.dart';

import '../../init/controllers/init_controller.dart';

class MainController extends GetxController {
  // late final InitController _initC;

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

  void _init() {
    // if (Get.isRegistered<HomeController>()) {
    //   _homeC = Get.find<HomeController>();
    // } else {
    //   _homeC = Get.put(HomeController());
    // }

    // Get.put(HomeController());
    // Get.put(ProfileController());

    // if (Get.isRegistered<ProfileController>()) {
    //   _profileC = Get.find<ProfileController>();
    // } else {
    //   _profileC = Get.put(ProfileController());
    // }

    // print(
    //     'isRegistered HomeController = ${Get.isRegistered<HomeController>()}');
    // print(
    //     'isRegistered ProfileController = ${Get.isRegistered<ProfileController>()}');
  }

  void changeCurrentPage(int index) {
    // switch (index) {
    //   case 0:
    //     _homeC.fetchDashboard();
    //     break;
    //   case 3:
    //     _profileC.prepareStorage();
    //     break;
    //   default:
    // }

    currentPage.value = index;
  }
}
