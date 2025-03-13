import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../shared/shared_theme.dart';
import '../../../../utils/constants_assets.dart';
import '../../../helpers/format_date_time.dart';
import '../../widgets/card/cards.dart';
import '../../widgets/chip/builder_filter_chips.dart';
import '../controllers/assigned_overtime_controller.dart';

class AssignedOvertimeScreenView extends GetView<AssignedOvertimeController> {
  const AssignedOvertimeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        flexibleSpace: BuilderFilterChips(controller.filters),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Text(
                FormatDateTime.dateToString(
                  newPattern: 'EEE, dd MMM yyyy',
                  value: DateTime.now().toIso8601String(),
                ),
                style: textTheme.labelMedium?.copyWith(
                  fontWeight: SharedTheme.bold,
                ),
              ),
              const SizedBox(height: 16),
              Cards.filled(
                context: context,
                color: theme.colorScheme.surfaceContainerLowest,
                child: _builderItemHistory(isLoading: false),
              ),
            ],
          );
        },
        itemCount: 1,
      ),
    );
  }

  Widget _builderItemHistory({required bool isLoading}) {
    const datePattern = 'dd MMM, yyyy';
    Widget? Function(BuildContext, int) itemBuilder;

    if (isLoading) {
      itemBuilder = (context, index) {
        return ListTile(
          leading: Skeleton.shade(
            child: SvgPicture.asset(ConstantsAssets.icNightShift),
          ),
          title: const Text('Dummy Events'),
          subtitle: const Text('-- ---, ----'),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('--:--'),
              Skeleton.shade(
                child: _builderState(context, index),
              ),
            ],
          ),
        );
      };
    } else {
      itemBuilder = (context, index) {
        final textTheme = context.textTheme;
        final now = DateTime.now().toIso8601String();

        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(ConstantsAssets.icDayNight),
          title: Text(index == 0 ? 'Lembur tidak dibayar' : 'Lembur dibayar'),
          titleTextStyle: textTheme.titleSmall?.copyWith(
            fontWeight: SharedTheme.semiBold,
          ),
          subtitle: Text(
            FormatDateTime.dateToString(
              newPattern: datePattern,
              value: now,
              defaultOutput: '-- ---, ----',
            ),
          ),
          subtitleTextStyle: textTheme.bodyMedium?.copyWith(
            color: SharedTheme.quertenaryTextColor,
            fontWeight: SharedTheme.medium,
            fontSize: 12,
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                FormatDateTime.dateToString(
                  newPattern: 'HH:mm',
                  value: now,
                ),
                style: textTheme.labelLarge?.copyWith(
                  fontWeight: SharedTheme.semiBold,
                ),
              ),
              _builderState(context, index),
            ],
          ),
        );
      };
    }

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: itemBuilder,
      itemCount: (isLoading) ? 10 : 2,
    );
  }

  Widget _builderState(BuildContext context, int index) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    Color? color;
    String text = '';

    if (index == 1) {
      color = SharedTheme.bgSuccess;
      text = 'Sudah diambil';
    } else {
      color = SharedTheme.bgInverseGrey;
      text = 'Belum diambil';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: textTheme.labelSmall?.copyWith(color: theme.colorScheme.surface),
      ),
    );
  }
}
