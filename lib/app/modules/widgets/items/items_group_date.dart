import 'package:assist_hadir/app/data/model/events/events_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../shared/shared_theme.dart';
import '../../../../utils/constants_assets.dart';
import '../../../helpers/format_date_time.dart';
import '../card/cards.dart';

class ItemsGroupDate extends StatelessWidget {
  final DateTime date;
  final List<EventsModel> events;

  const ItemsGroupDate({
    super.key,
    required this.date,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        Text(
          FormatDateTime.dateToString(
            newPattern: 'EEE, dd MMM yyyy',
            value: date.toIso8601String(),
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
            events: events,
          ),
        ),
      ],
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
