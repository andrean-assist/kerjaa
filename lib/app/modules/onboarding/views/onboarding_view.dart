import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../shared/shared_theme.dart';
import '../../../../utils/constants_strings.dart';
import '../../widgets/buttons/buttons.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: builderContent(context),
      ),
      bottomSheet: builderFooter(context),
    );
  }

  Widget builderContent(BuildContext context) {
    final textTheme = context.textTheme;

    return PageView.builder(
      controller: controller.pageC,
      itemBuilder: (context, index) {
        final title = ConstantsStrings.onboardingList[index].title;
        final description = ConstantsStrings.onboardingList[index].description;
        final image = ConstantsStrings.onboardingList[index].image;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image, height: 261),
              const SizedBox(height: 24),
              Text(
                title,
                // maxFontSize: 20,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: SharedTheme.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                description,
                // minFontSize: 16,
                style: textTheme.bodySmall?.copyWith(
                  color: SharedTheme.secondaryTextColor,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
      itemCount: ConstantsStrings.onboardingList.length,
    );
  }

  Widget builderFooter(BuildContext context) {
    final theme = context.theme;

    return Container(
      color: theme.colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Buttons.filled(
              onPressed: controller.moveToNextPage,
              child: Obx(
                () {
                  final isDone = controller.currentPage.value ==
                      (ConstantsStrings.onboardingList.length - 1);

                  return Text(
                    isDone
                        ? ConstantsStrings.onboardingDone
                        : ConstantsStrings.onboardingNext,
                    style: const TextStyle(color: Colors.white),
                  );
                },
              ),
              style: FilledButton.styleFrom(
                backgroundColor: SharedTheme.filledBtnColor,
                foregroundColor: Colors.white,
                maximumSize: const Size.fromHeight(44),
                textStyle: Get.context!.textTheme.titleSmall?.copyWith(
                  fontWeight: SharedTheme.semiBold,
                  fontSize: 16,
                ),
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  ConstantsStrings.onboardingList.length,
                  (index) {
                    double width;
                    BoxDecoration decoration;

                    if (index == controller.currentPage.value) {
                      width = 20;
                      decoration = BoxDecoration(
                        color: const Color(0XFF329ED8),
                        borderRadius: BorderRadius.circular(16),
                      );
                    } else {
                      width = 10;
                      decoration = BoxDecoration(
                        color: const Color(0xFFE2E8F0),
                        borderRadius: BorderRadius.circular(16),
                      );
                    }

                    return builderDotsIndicator(
                      theme: theme,
                      width: width,
                      decoration: decoration,
                    );
                  },
                  growable: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget builderDotsIndicator({
    required ThemeData theme,
    required double width,
    required BoxDecoration decoration,
  }) {
    return AnimatedContainer(
      duration: Durations.long1,
      curve: Curves.fastOutSlowIn,
      width: width,
      height: 10,
      margin: const EdgeInsets.only(right: 8),
      decoration: decoration,
    );
  }
}
