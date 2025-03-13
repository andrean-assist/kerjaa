import 'package:assist_hadir/shared/shared_theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import 'package:get/get.dart';

import '../../../../utils/constants_assets.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/chip/builder_filter_chips.dart';
import '../controllers/leave_controller.dart';

class LeaveView extends GetView<LeaveController> {
  const LeaveView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final width = context.mediaQuerySize.width;
    final height = context.mediaQuerySize.height;

    return Scaffold(
      backgroundColor: SharedTheme.appBarColor,
      appBar: _builderAppbar(textTheme),
      body: FlutterCarousel.builder(
        itemCount: controller.dataLeave.length,
        itemBuilder: (context, index, realIndex) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          margin: const EdgeInsets.only(top: 16, left: 16),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: SharedTheme.dividerColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    children: [
                      Text(
                        'Sisa cuti tahunan',
                        style: textTheme.bodyMedium,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.info_rounded,
                          color: SharedTheme.lightIconColor,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '12 hari',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: SharedTheme.semiBold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 2,
                children: [
                  Text(
                    'Masa berlaku',
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                  // const SizedBox(height: 2),
                  Text(
                    '01 Des 2024',
                    style: textTheme.labelMedium?.copyWith(
                      fontWeight: SharedTheme.bold,
                      height: 1.5,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        options: FlutterCarouselOptions(
          height: width / 3.5,
          floatingIndicator: false,
          enableInfiniteScroll: true,
          indicatorMargin: 12,
          padEnds: false,
          slideIndicator: CircularSlideIndicator(
            slideIndicatorOptions: const SlideIndicatorOptions(
              currentIndicatorColor: SharedTheme.bgInverseGrey,
              indicatorBackgroundColor: SharedTheme.whiteColor,
              enableAnimation: true,
              itemSpacing: 16,
            ),
          ),
        ),
      ),
      bottomSheet: BottomSheet(
        constraints: BoxConstraints.expand(height: height * 0.72),
        showDragHandle: true,
        dragHandleColor: SharedTheme.dividerDragColor,
        onClosing: () {},
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: 8,
                      children: [
                        _builderCustomTab(
                          // isActive: state.value == 0,
                          isActive: true,
                          text: 'Pengajuan',
                          onPressed: () {},
                          // onPressed: () => controller.changeScreen(0),
                        ),
                        _builderCustomTab(
                          isActive: false,
                          // isActive: state.value == 1,
                          text: 'Ditugaskan',
                          onPressed: () {},
                          // onPressed: () => controller.changeScreen(1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    BuilderFilterChips(controller.filters),
                  ],
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Image.asset(
                          ConstantsAssets.imgSubmissionOvertime,
                        ),
                      ),
                      const SizedBox(height: 24),
                      AutoSizeText(
                        'Belum ada pengajuaan cuti',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: SharedTheme.bold,
                          color: SharedTheme.primaryTextColor,
                        ),
                        maxFontSize: 16,
                      ),
                      const SizedBox(height: 4),
                      AutoSizeText(
                        'Anda belum ada melakukan pengajuan cuti, nanti kalau ada bakalan tampil disini ya.',
                        style: textTheme.bodySmall?.copyWith(
                          fontWeight: SharedTheme.medium,
                          color: SharedTheme.quertenaryTextColor,
                        ),
                        textAlign: TextAlign.center,
                        maxFontSize: 12,
                      ),
                    ],
                  ),
                ),
                Buttons.filled(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 21),
                  onPressed: () {},
                  child: const Text('Buat pengajuan'),
                ),
                // const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar _builderAppbar(TextTheme textTheme) {
    return AppBar(
      leading: const BackButton(color: SharedTheme.whiteColor),
      title: Text(
        'Pengajuan Cuti',
        style: textTheme.titleLarge?.copyWith(
          color: SharedTheme.whiteColor,
        ),
      ),
      centerTitle: false,
      backgroundColor: SharedTheme.appBarColor,
    );
  }

  Widget _builderCustomTab({
    required bool isActive,
    required String text,
    required VoidCallback onPressed,
  }) {
    if (isActive) {
      return Expanded(
        child: Buttons.filledTonal(
          width: double.infinity,
          style: FilledButton.styleFrom(
            backgroundColor: SharedTheme.filledTonalBtnColor,
            foregroundColor: SharedTheme.textBtnColor,
            side: const BorderSide(
              color: SharedTheme.outlinedBtnColor,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
            textStyle: const TextStyle(
              fontWeight: SharedTheme.semiBold,
            ),
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
      );
    } else {
      return Expanded(
        child: Buttons.text(
          width: double.infinity,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
            textStyle: const TextStyle(
              fontWeight: SharedTheme.semiBold,
            ),
            foregroundColor: SharedTheme.disabledColor,
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
      );
    }
  }
}
