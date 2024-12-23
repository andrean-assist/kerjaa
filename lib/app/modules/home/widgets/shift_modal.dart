import 'package:assist_hadir/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../shared/shared_theme.dart';
import '../../../../utils/constants_assets.dart';

class ShiftModal extends GetView<HomeController> {
  const ShiftModal({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    final data = controller.dataDashboard?.shift;
    final isDisabledShiftMorning = data?.pagi?.disabledShift ?? true;
    final isDisabledShiftDay = data?.siang?.disabledShift ?? true;
    final isDisabledShiftNight = data?.malam?.disabledShift ?? true;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Obx(
        () => Column(
          children: [
            Text(
              'Hadir hari ini!',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: SharedTheme.semiBold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Yuk, silahkan pilih shift kerja Anda.',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            _builderCardShift(
              context: context,
              isVisible: isDisabledShiftMorning,
              isEnabled: controller.shift.value == 'pagi',
              iconPath: ConstantsAssets.icMorningShift,
              text: 'Shift pagi',
              onTap: () => controller.setShift('pagi'),
            ),
            const SizedBox(height: 12),
            _builderCardShift(
              context: context,
              isVisible: isDisabledShiftDay,
              isEnabled: controller.shift.value == 'siang',
              iconPath: ConstantsAssets.icDayShift,
              text: 'Shift siang',
              onTap: () => controller.setShift('siang'),
            ),
            const SizedBox(height: 12),
            _builderCardShift(
              context: context,
              isVisible: isDisabledShiftNight,
              isEnabled: controller.shift.value == 'malam',
              iconPath: ConstantsAssets.icNightShift,
              text: 'Shift malam',
              onTap: () => controller.setShift('malam'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _builderCardShift({
    required BuildContext context,
    required String iconPath,
    required String text,
    required bool isVisible,
    required bool isEnabled,
    required Function() onTap,
  }) {
    return Visibility(
      visible: isVisible,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: ShapeDecoration(
            color: isEnabled ? SharedTheme.primaryBtnLightColor : Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: isEnabled
                    ? SharedTheme.outlinedBtnColor
                    : const Color(0xFFE2E8F0),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(iconPath),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
