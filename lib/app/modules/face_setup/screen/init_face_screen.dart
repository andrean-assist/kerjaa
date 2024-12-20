import 'package:assist_hadir/app/modules/face_setup/controllers/face_setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../shared/shared_theme.dart';
import '../../../../utils/constants_assets.dart';
import '../../widgets/buttons/buttons.dart';
import '../widgets/progress/dashed_circle_progress.dart';

class InitFaceScreen extends GetView<FaceSetupController> {
  final double circleDiameter;

  const InitFaceScreen(this.circleDiameter, {super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _builderCircle(textTheme),
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
              progress: 0,
            ), // Contoh progress 70%
            ClipOval(
              child: SizedBox(
                width:
                    circleDiameter * 0.3, // Sesuaikan dengan ukuran lingkaran
                height: circleDiameter * 0.3,
                child: SvgPicture.asset(
                  ConstantsAssets.icHintFaceSetup,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 58),
        Text(
          'Cara mendaftarkan wajah Anda',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: SharedTheme.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Pertama-tama, posisikan wajah Anda dibingkai kamera, setelah itu gerakan kepala Anda dalam lingkaran untuk menampilkan semua sudut wajah Anda.',
          style: textTheme.bodyMedium?.copyWith(
            color: SharedTheme.secondaryTextColor,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _builderButton() {
    return Buttons.filled(
      width: double.infinity,
      onPressed: controller.initRegister,
      child: const Text('Mulai'),
    );
  }
}
