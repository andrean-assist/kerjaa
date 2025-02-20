import 'package:assist_hadir/app/data/model/shift/detail_shift/absen/absen_model.dart';
import 'package:assist_hadir/app/helpers/format_date_time.dart';
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

    final data = controller.dataDashboard?.organization?.shift;
    final pagi = data?.pagi;
    final siang = data?.siang;
    final malam = data?.malam;

    final isDisabledShiftMorning = pagi?.disabledShift ?? true;
    final isDisabledShiftDay = siang?.disabledShift ?? true;
    final isDisabledShiftNight = malam?.disabledShift ?? true;

    // bandingkan jam sekarang dengan jam end shift
    final isActivedShiftMorning = _isActivedShift(pagi?.absen);
    final isActivedShiftDay = _isActivedShift(siang?.absen);
    const isActivedShiftNight = true;

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
              isVisible: !isDisabledShiftMorning,
              isEnabled: controller.shift.value == 'pagi',
              isActived: isActivedShiftMorning,
              iconPath: ConstantsAssets.icMorningShift,
              text: 'Shift pagi',
              onTap: () => controller.setShift('pagi'),
            ),
            const SizedBox(height: 12),
            _builderCardShift(
              context: context,
              isVisible: !isDisabledShiftDay,
              isEnabled: controller.shift.value == 'siang',
              isActived: isActivedShiftDay,
              iconPath: ConstantsAssets.icDayShift,
              text: 'Shift siang',
              onTap: () => controller.setShift('siang'),
            ),
            const SizedBox(height: 12),
            _builderCardShift(
              context: context,
              isVisible: !isDisabledShiftNight,
              isEnabled: controller.shift.value == 'malam',
              isActived: isActivedShiftNight,
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
    required bool isActived,
    required bool isEnabled,
    required Function() onTap,
  }) {
    return Visibility(
      visible: isVisible,
      child: GestureDetector(
        onTap: isActived ? onTap : null,
        child: Opacity(
          opacity: isActived ? 1 : 0.7,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: ShapeDecoration(
              color: isEnabled
                  ? SharedTheme.primaryBtnLightColor
                  : SharedTheme.whiteColor,
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
      ),
    );
  }

  bool _isActivedShift(AbsenModel? absen) {
    final now = DateTime.now();

    if (absen != null && absen.end != null) {
      final shiftEnd = FormatDateTime.iso8601ToDateTime(
        value: now
            .copyWith(
              hour: int.parse(absen.end!.split(':')[0]),
              minute: int.parse(absen.end!.split(':')[1]),
            )
            .toIso8601String(),
      )!;
      return now.isBefore(shiftEnd);
    }
    return false;
  }
}
