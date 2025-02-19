import 'package:assist_hadir/app/modules/home/views/home_view.dart';
import 'package:assist_hadir/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentPage.value,
          children: const [
            HomeView(),
            Center(
              child: Text('Halaman Karyawan'),
            ),
            Center(
              child: Text('Halaman Pesan'),
            ),
            ProfileView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.currentPage.value,
          onDestinationSelected: controller.changeCurrentPage,
          destinations: controller.listMainMenu
              .map(
                (e) => NavigationDestination(
                  icon: SvgPicture.asset(e.iconPath),
                  label: e.label,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
