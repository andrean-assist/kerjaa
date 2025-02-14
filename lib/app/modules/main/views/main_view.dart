import 'package:assist_hadir/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeView(),
      // body: Obx(
      //   () => IndexedStack(
      //     index: controller.currentPage.value,
      //     children: [HomeView()],
      //   ),
      // ),
      // bottomNavigationBar: NavigationBar(
      //   destinations: [],
      // ),
    );
  }
}
