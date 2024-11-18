import 'package:assist_hadir/app/modules/face_setup/screen/init_face_screen.dart';
import 'package:assist_hadir/shared/shared_enum.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/face_setup_controller.dart';
import '../screen/prepare_face_screen.dart';
import '../screen/ready_face_screen_new.dart';

class FaceSetupView extends GetView<FaceSetupController> {
  const FaceSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = context.theme;
    final size = context.mediaQuerySize;
    final circleDiameter = size.width * 0.7;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftarkan Wajah'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Obx(
            () => switch (controller.statusSetup.value) {
              StatusFaceSetup.init => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 32,
                  ),
                  child: InitFaceScreen(circleDiameter),
                ),
              StatusFaceSetup.prepare => const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 32,
                  ),
                  child: PrepareFaceScreen(),
                ),
              StatusFaceSetup.ready => ReadyFaceScreenNew(circleDiameter),
              _ => const SizedBox(),
            },
          ),
        ),
      ),
    );

    // return Scaffold(
    //   backgroundColor: Colors.red,
    //   appBar: AppBar(
    //     title: const Text('Daftarkan Wajah'),
    //     centerTitle: false,
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.symmetric(
    //       horizontal: 16,
    //       vertical: 32,
    //     ),
    //     child: SizedBox(
    //       width: double.infinity,
    //       child: Obx(
    //         () => switch (controller.statusSetup.value) {
    //           StatusFaceSetup.init => Padding(
    //               padding: const EdgeInsets.symmetric(
    //                 horizontal: 16,
    //                 vertical: 32,
    //               ),
    //               child: InitFaceScreen(circleDiameter),
    //             ),
    //           StatusFaceSetup.prepare => const Padding(
    //               padding: EdgeInsets.symmetric(
    //                 horizontal: 16,
    //                 vertical: 32,
    //               ),
    //               child: PrepareFaceScreen(),
    //             ),
    //           StatusFaceSetup.ready => ReadyFaceScreenNew(circleDiameter),
    //           _ => const SizedBox(),
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}
