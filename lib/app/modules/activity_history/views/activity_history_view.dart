import 'package:assist_hadir/app/data/model/events/events_model.dart';
import 'package:assist_hadir/app/modules/activity_history/widgets/modals/custom_date_activity_history_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../shared/shared_theme.dart';
import '../../../../utils/constants_assets.dart';
import '../../../helpers/format_date_time.dart';
import '../../widgets/card/cards.dart';
import '../../widgets/modal/modals.dart';
import '../controllers/activity_history_controller.dart';

class ActivityHistoryView extends GetView<ActivityHistoryController> {
  const ActivityHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Aktifitas')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: _builderFilterChips(context),
            ),
            const SizedBox(height: 16),
            _builderHistory(context),
          ],
        ),
      ),
    );
  }

  Widget _builderFilterChips(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: controller.filters
            .map((e) => _builderItemChip(context: context, text: e))
            .toList(),
      ),
    );
  }

  Widget _builderItemChip({
    required BuildContext context,
    required String text,
  }) {
    final index = controller.filters.indexOf(text);
    return Container(
      margin: EdgeInsets.only(
        left: (index == 0) ? 12 : 0,
        right: 12,
      ),
      child: Obx(
        () {
          final selectedFilter = controller.selectedFilter.value;
          final isSelected = index == selectedFilter;

          return ChoiceChip(
            label: Text(
              text,
              style: TextStyle(
                color: isSelected
                    ? SharedTheme.textBtnColor
                    : const Color(0xFF64748B),
              ),
            ),
            selected: isSelected,
            color: WidgetStatePropertyAll(
              isSelected ? const Color(0xFFEBF5FB) : SharedTheme.whiteColor,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: isSelected
                    ? SharedTheme.textBtnColor
                    : const Color(0xFFE2E8F0),
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            onSelected: (_) async {
              controller.setFilter(index);

              if (index == 3) {
                _showModal(context);
              }
            },
            showCheckmark: false,
          );
        },
      ),
    );
  }

  Widget _builderHistory(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: controller.obx(
        (state) => ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = state?[index];
            final date = item?.date;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Text(
                  FormatDateTime.dateToString(
                    newPattern: 'EEE, dd MMM yyyy',
                    value: date,
                  ),
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: SharedTheme.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Cards.filled(
                  context: context,
                  color: theme.colorScheme.surfaceContainerLowest,
                  child: _builderItemHistory(
                    isLoading: false,
                    events: item?.events,
                  ),
                ),
              ],
            );
          },
          itemCount: state?.length ?? 0,
        ),
        onLoading: Skeletonizer(
          enabled: true,
          child: Cards.filled(
            context: context,
            color: theme.colorScheme.surfaceContainerLowest,
            child: _builderItemHistory(isLoading: true),
          ),
        ),
        onEmpty: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 21),
          child: Text(
            'Belum ada riwayat aktivitas terakhir anda',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _builderItemHistory({
    required bool isLoading,
    List<EventsModel>? events,
  }) {
    const datePattern = 'dd MMM, yyyy';
    Widget? Function(BuildContext, int) itemBuilder;

    if (isLoading) {
      itemBuilder = (context, index) {
        return ListTile(
          leading: Skeleton.shade(
            child: SvgPicture.asset(ConstantsAssets.icStartTimeWork),
          ),
          title: const Text('Dummy Events'),
          subtitle: const Text('-- ---, ----'),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('--:--'),
              Skeleton.shade(
                child: _builderState(
                  context,
                  const EventsModel(approved: 'valid'),
                ),
              ),
            ],
          ),
        );
      };
    } else {
      itemBuilder = (context, index) {
        final event = events![index];

        String? assetIcon;
        var type = '-';

        switch (event.eventType) {
          case 'checkIn':
            assetIcon = ConstantsAssets.icStartTimeWork;
            type = 'Check in';
            break;
          case 'breakStart':
            assetIcon = ConstantsAssets.icBreak;
            type = 'Istirahat';
            break;
          case 'breakStop':
            assetIcon = ConstantsAssets.icBreak;
            type = 'Selesai istirahat';
            break;
          case 'checkOut':
            assetIcon = ConstantsAssets.icEndTimeWork;
            type = 'Check out';
            break;
          default:
        }

        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: (assetIcon != null) ? SvgPicture.asset(assetIcon) : null,
          title: Text(type),
          subtitle: Text(
            FormatDateTime.dateToString(
              newPattern: datePattern,
              value: event.eventTime,
              defaultOutput: '-- ---, ----',
            ),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                FormatDateTime.dateToString(
                  newPattern: 'HH:mm',
                  value: event.eventTime,
                ),
              ),
              _builderState(context, event),
            ],
          ),
        );
      };
    }

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: itemBuilder,
      itemCount: (isLoading) ? 10 : events!.length,
    );
  }

  void _showModal(BuildContext context) {
    Modals.bottomSheetWithClose(
      context: context,
      enableDrag: true,
      isDismissible: false,
      content: const CustomDateActivityHistoryModal(),
    );
  }

  Widget _builderState(BuildContext context, EventsModel event) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    Color? color;

    switch (event.approved) {
      case 'valid':
        color = SharedTheme.filledBtnColor;
        break;
      case 'pending':
        color = SharedTheme.filledPendingColor;
        break;
      case 'rejected':
        color = SharedTheme.filledRejectedColor;
        break;
      default:
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        (event.approved != null) ? event.approved!.capitalizeFirst! : '-',
        style: textTheme.labelSmall?.copyWith(color: theme.colorScheme.surface),
      ),
    );
  }

}
