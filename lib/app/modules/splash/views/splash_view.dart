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
    return Scaffold(
      backgroundColor: SharedTheme.bgBrand,
      body: SafeArea(
        child: Center(
          child: SvgPicture.asset(ConstantsAssets.icLogoSplash),
        ),
      ),
    );
  }
}
