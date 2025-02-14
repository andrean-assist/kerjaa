import 'package:assist_hadir/utils/constants_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../shared/shared_theme.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(21),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    ConstantsAssets.imgLogo,
                    height: 112,
                  ),
                  Text(
                    'Kerjaa',
                    style: textTheme.displaySmall?.copyWith(
                      fontWeight: SharedTheme.extraBold,
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  ConstantsAssets.icLogoPoweredAssist,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
