import 'dart:io';

import 'package:assist_hadir/app/modules/face_setup/controllers/face_setup_controller.dart';
import 'package:assist_hadir/shared/shared_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/shared_theme.dart';
import '../../widgets/buttons/buttons.dart';
import '../widgets/progress/dashed_circle_progress.dart';

class SuccessFaceScreen extends GetView<FaceSetupController> {
  final double circleDiameter;

  const SuccessFaceScreen(this.circleDiameter, {super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _builderCircle(textTheme),
        _builderHint(textTheme),
        _builderButton(),
      ],
    );
  }

  Widget _builderCircle(TextTheme textTheme) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            DashedCircleProgress(
              circleDiameter: circleDiameter,
              progress: 1,
            ),
            CircleAvatar(
              radius: circleDiameter * 0.45,
              foregroundImage: FileImage(
                File(
                  controller.captureRequest?.path ?? '',
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _builderHint(TextTheme textTheme) {
    if (controller.statusAbsenceArgs != StatusAbsenceSetup.register) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Scan wajah valid',
            style: textTheme.titleLarge?.copyWith(
              fontWeight: SharedTheme.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Scan wajah Anda valid, Anda berhasil melakukan ${controller.readyDescription}',
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge?.copyWith(fontSize: 16),
          ),
        ],
      );
    }

    return Text(
      'Wajah Anda berhasil di daftarkan, Anda bisa mulai absen sekarang.',
      style: textTheme.titleLarge?.copyWith(
        fontWeight: SharedTheme.bold,
        fontSize: 20,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _builderButton() {
    return Obx(
      () => Buttons.filled(
        width: double.infinity,
        state: controller.isLoading.value,
        onPressed: controller.action,
        child: Text(controller.successBtnText),
      ),
    );
  }
}
