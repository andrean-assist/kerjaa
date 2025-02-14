import 'package:action_slider/action_slider.dart';
import 'package:assist_hadir/app/data/model/events/events_model.dart';
import 'package:assist_hadir/app/helpers/format_date_time.dart';
import 'package:assist_hadir/app/helpers/time_helper.dart';
import 'package:assist_hadir/app/modules/home/widgets/shift_modal.dart';
import 'package:assist_hadir/app/modules/widgets/buttons/custom_button.dart';
import 'package:assist_hadir/app/modules/widgets/modal/modals.dart';
import 'package:assist_hadir/shared/shared_enum.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../shared/shared_theme.dart';
import '../../../../utils/constants_assets.dart';
import '../../../../utils/constants_connect.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/card/cards.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: controller.scrollC,
        slivers: [
          _builderAppBar(),
          _builderBody(context),
        ],
      ),
    );
  }

  Widget _builderAppBar() {
    return SliverAppBar(
      pinned: true,
      toolbarHeight: 68,
      leadingWidth: 100,
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 0, 12),
        child: Image.asset(
          ConstantsAssets.imgLogo,
          alignment: Alignment.topLeft,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: controller.moveToProfile,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Obx(
              () => CachedNetworkImage(
                imageUrl:
                    '${ConstantsConnect.endPointBaseUrlImage}${controller.profilePicture.value}',
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  backgroundImage: imageProvider,
                  radius: 28,
                ),
                progressIndicatorBuilder: (context, url, progress) =>
                    CircleAvatar(
                  child: CircularProgressIndicator.adaptive(
                    value: progress.progress,
                  ),
                ),
                errorWidget: (context, url, error) => const CircleAvatar(
                  backgroundImage: AssetImage(ConstantsAssets.imgNoPhoto),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: ObxValue(
          (state) => Container(
            color: state.value ? Colors.white : SharedTheme.filledBtnColor,
          ),
          controller.isScroll,
        ),
      ),
    );
  }

  Widget _builderBody(BuildContext context) {
    final textTheme = context.textTheme;
    return SliverToBoxAdapter(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _builderGreetingMessage(textTheme),
          _builderListHeaderCard(),
          _builderMenu(context),
          _builderAttributesCard(context),
          _builderLastHistory(context),
          _builderAnnouncement(context),
        ],
      ),
    );
  }

  Widget _builderGreetingMessage(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: StreamBuilder(
        stream: TimeHelper.streamDateTime(),
        builder: (context, snapshot) {
          final dateTime = snapshot.data;
          final message = controller.greetingMessage(dateTime);

          return Skeletonizer(
            enabled: dateTime == null,
            child: _builderTextDisplay(
              textTheme: textTheme,
              title: message.$1,
              subtitle: message.$2,
            ),
          );
        },
      ),
    );
  }

  Widget _builderTextDisplay({
    required TextTheme textTheme,
    required String title,
    required String subtitle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          title,
          style: textTheme.titleLarge?.copyWith(
            fontWeight: SharedTheme.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 4),
        AutoSizeText(
          subtitle,
          style: textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _builderListHeaderCard() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final maxWidthShift = maxWidth / 1.3;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(
            () {
              final organization = controller.dataDashboard?.organization;
              final isShift = organization?.isShift;
              final shift = organization?.shift;
              final haveShift = isShift != null && shift != null;

              return Visibility(
                visible: haveShift,
                replacement: _builderDisabledShift(context, maxWidth),
                child: Row(
                  children: [
                    _builderHeaderCard(
                      context: context,
                      width: maxWidthShift,
                      outPadding: const EdgeInsets.symmetric(horizontal: 16),
                      isShift: isShift,
                    ),
                    _builderHeaderCard(
                      context: context,
                      width: maxWidthShift,
                      isShift: isShift,
                    ),
                    _builderHeaderCard(
                      context: context,
                      width: maxWidthShift,
                      outPadding: const EdgeInsets.symmetric(horizontal: 16),
                      isShift: isShift,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _builderHeaderCard({
    required BuildContext context,
    required double width,
    EdgeInsets? outPadding,
    required bool? isShift,
  }) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Cards.filled(
      context: context,
      inPadding: const EdgeInsets.fromLTRB(16, 24, 16, 28),
      outPadding: outPadding,
      color: theme.colorScheme.surfaceContainerLowest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: SizedBox(
        width: width,
        child: Skeletonizer(
          enabled: controller.isLoading.value,
          child: Column(
            children: [
              StreamBuilder(
                stream: TimeHelper.streamDateTime(),
                builder: (context, snapshot) {
                  final dateTime = snapshot.data;

                  var time = '--:--:--';
                  var date = '----, -- --- ----';

                  if (dateTime != null) {
                    time = FormatDateTime.dateToString(
                      newPattern: 'HH:mm:ss',
                      value: dateTime.toString(),
                    );
                    date = FormatDateTime.dateToString(
                      newPattern: 'EEEE, dd MMM yyyy',
                      value: dateTime.toString(),
                    );
                  }

                  return Skeletonizer(
                    enabled: dateTime == null,
                    child: Column(
                      children: [
                        Text(
                          time,
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: SharedTheme.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          date,
                          style: textTheme.bodyMedium
                              ?.copyWith(color: theme.hintColor),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _builderCountForwardTimer(context),
                  Text(
                    'Jam',
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: SharedTheme.semiBold,
                      color: theme.hintColor,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Shift pagi 8:30 AM to 17:00PM',
                style: textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              _builderBtnAbsence(context, isShift),
            ],
          ),
        ),
      ),
    );
  }

  Widget _builderDisabledShift(BuildContext context, double width) {
    final textTheme = context.textTheme;
    final size = context.mediaQuerySize;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      width: width,
      child: Column(
        children: [
          Image.asset(
            ConstantsAssets.imgNotAllowedAttendance,
            height: size.height * 0.25,
          ),
          const SizedBox(height: 12),
          Text(
            'Shift kerja belum diatur',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: SharedTheme.semiBold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Shift kerja Anda belum dibuat oleh atasan, nanti kalau sudah ada bakalan tampil di sini ya!',
            style: textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _builderCountForwardTimer(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return ObxValue(
      (data) {
        final splitTime = data.split(':');

        return Row(
          children: splitTime
              .map(
                (e) => _builderCircleContainer(
                  context: context,
                  child: Text(
                    e,
                    style: textTheme.titleLarge?.copyWith(
                      color: theme.hintColor,
                    ),
                  ),
                  margin: const EdgeInsets.only(right: 10),
                  radiusCircular: 24,
                ),
              )
              .toList(),
        );
      },
      controller.countForwardTime,
    );
  }

  Widget _builderBtnAbsence(BuildContext context, [bool? isShift = false]) {
    final textTheme = context.textTheme;

    return Obx(
      () {
        final startTime = controller.startTime.value;
        final restStartTime = controller.restStartTime.value;
        final restEndTime = controller.restEndTime.value;
        final endTime = controller.endTime.value;

        var statusAbsence = StatusAbsenceSetup.checkIn;
        var isVisibleBtnAbsence = true;
        var isVisibleBtnSlider = false;

        // Widget? icon;
        // ButtonStyle? style;
        ButtonType buttonType = ButtonType.filled;
        String textBtn = 'Check in';

        // jika user sudah melakukan absensi maka tombol checkout tampil
        // dan tombol slide memulai istirahat juga tampil dengan posisi ke kiri atau 0
        if (startTime != null) {
          statusAbsence = StatusAbsenceSetup.checkOut;
          buttonType = ButtonType.filledTonal;

          // icon = SvgPicture.asset(ConstantsAssets.icCheckout);
          // style = FilledButton.styleFrom(
          //   backgroundColor: SharedTheme.primaryBtnLightColor,
          //   foregroundColor: SharedTheme.textBtnColor,
          // );
          textBtn = 'Check out';
          isVisibleBtnSlider = true;

          // jika jam istirahat sudah ada maka tampilan slide akan gone
          if ((restStartTime != null && restEndTime != null) ||
              endTime != null) {
            isVisibleBtnSlider = false;
          }

          if (endTime != null) {
            statusAbsence = StatusAbsenceSetup.checkIn;
            buttonType = ButtonType.filled;

            // icon = null;
            // style = null;
            textBtn = 'Check in';
            isVisibleBtnAbsence = true;
          }
        }

        return Column(
          spacing: 8,
          children: [
            Visibility(
              visible: isVisibleBtnAbsence,
              child: Container(
                margin: const EdgeInsets.only(top: 24),
                child: CustomButton(
                  type: buttonType!,
                  width: double.infinity,
                  // icon: icon,
                  // style: style,
                  onPressed: () {
                    if (statusAbsence == StatusAbsenceSetup.checkIn) {
                      if (isShift ?? false) {
                        _showModalShift(context);
                      } else {
                        controller.moveToMaps(statusAbsence);
                      }
                    } else {
                      controller.moveToMaps(statusAbsence);
                    }
                  },
                  child: Text(textBtn),
                ),
              ),
            ),
            Visibility(
              visible: isVisibleBtnSlider,
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                child: ActionSlider.custom(
                  outerBackgroundBuilder: (context, state, child) => child!,
                  foregroundBuilder: (context, state, child) => child!,
                  backgroundBuilder: (context, state, child) => child!,
                  backgroundColor: Colors.transparent,
                  toggleMargin: const EdgeInsets.fromLTRB(8, 7, 6, 7),
                  boxShadow: const [],
                  outerBackgroundChild: Container(
                    decoration: const BoxDecoration(
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: SharedTheme.textBtnColor,
                          width: 1,
                        ),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                  ),
                  foregroundChild: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: SharedTheme.filledBtnColor,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: SvgPicture.asset(
                      ConstantsAssets.icBreak,
                      colorFilter: const ColorFilter.mode(
                        SharedTheme.primaryBtnLightColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  backgroundChild: Center(
                    child: Container(
                      margin: EdgeInsets.only(
                        left: controller.isRest.value ? 0 : 32,
                        right: controller.isRest.value ? 56 : 0,
                      ),
                      child: AutoSizeText(
                        'Slide untuk ${controller.isRest.value ? 'akhiri' : 'memulai'} istirahat',
                        style: textTheme.titleMedium?.copyWith(
                          color: SharedTheme.textBtnColor,
                          fontWeight: SharedTheme.semiBold,
                        ),
                        maxFontSize: 15,
                      ),
                    ),
                  ),
                  movementDuration: Duration.zero,
                  actionThresholdType: ThresholdType.release,
                  reverseSlideAnimationCurve: Curves.fastLinearToSlowEaseIn,
                  reverseSlideAnimationDuration: Duration.zero,
                  controller: controller.actionSliderC,
                  stateChangeCallback: (oldState, state, ctr) {
                    if (oldState?.position == 1 && state.position == 1) {
                      ctr.setAnchorPosition(1);
                    }

                    if (oldState?.position == 0 && state.position == 0) {
                      ctr.setAnchorPosition(0);
                    }
                  },
                  onTap: null,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _builderMenu(BuildContext context) {
    final textTheme = context.textTheme;
    final theme = context.theme;

    return Cards.filled(
      context: context,
      inPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      outPadding: const EdgeInsets.symmetric(horizontal: 16),
      color: theme.colorScheme.surfaceContainerLowest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 12,
        ),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final menu = controller.listMenu[index];
          return Column(
            spacing: 4,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: menu.onPressed,
                icon: SvgPicture.asset(
                  menu.icon,
                  width: 28,
                  height: 28,
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(menu.color),
                ),
                padding: const EdgeInsets.all(10),
              ),
              Text(
                menu.label,
                style: textTheme.labelMedium?.copyWith(
                  fontWeight: SharedTheme.semiBold,
                ),
              ),
            ],
          );
        },
        itemCount: controller.listMenu.length,
      ),
    );
  }

  Widget _builderAttributesCard(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Cards.filled(
      context: context,
      inPadding: const EdgeInsets.fromLTRB(16, 24, 16, 28),
      outPadding: const EdgeInsets.symmetric(horizontal: 16),
      color: theme.colorScheme.surfaceContainerLowest,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jam kerja hari ini',
            style: textTheme.titleLarge?.copyWith(
              fontSize: 16,
              fontWeight: SharedTheme.semiBold,
            ),
          ),
          const SizedBox(height: 21),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              controller.dataAttributes.length,
              (index) => Column(
                children: [
                  _builderCircleContainer(
                    context: context,
                    child: SvgPicture.asset(
                      controller.dataAttributes[index],
                    ),
                    radiusCircular: 16,
                  ),
                  const SizedBox(height: 4),
                  ObxValue(
                    (data) => Skeletonizer(
                      enabled: controller.isLoading.value,
                      child: Text(
                        (data.value != null)
                            ? (index == 0 || index == 2)
                                ? FormatDateTime.dateToString(
                                    newPattern: 'HH:mm',
                                    value: data.value,
                                  )
                                : '${data.value} Jam'
                            : '--:--',
                        style: textTheme.labelMedium?.copyWith(
                          fontWeight: SharedTheme.semiBold,
                        ),
                      ),
                    ),
                    switch (index) {
                      0 => controller.startTime,
                      1 => controller.restTime,
                      2 => controller.endTime,
                      3 => controller.workTime,
                      _ => RxnString(),
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _builderLastHistory(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          _builderTextDisplay(
            textTheme: textTheme,
            title: 'Aktivitas terakhir',
            subtitle: 'Riwayat aktivitas terakhir Anda',
          ),
          // const SizedBox(height: 16),
          Obx(
            () => Skeletonizer(
              enabled: controller.isLoading.value,
              child: Cards.filled(
                context: context,
                color: theme.colorScheme.surfaceContainerLowest,
                child: Column(
                  children: [
                    Skeleton.shade(
                      child: _builderItemHistory(controller.events),
                    ),
                    const SizedBox(height: 16),
                    Buttons.filledTonal(
                      width: double.infinity,
                      onPressed: controller.events.isNotEmpty
                          ? controller.moveToActivityHistory
                          : null,
                      icon: const Icon(Icons.arrow_forward_rounded),
                      iconAlignment: IconAlignment.end,
                      child: const Text('Lihat detail aktivitas'),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _builderAnnouncement(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          _builderTextDisplay(
            textTheme: textTheme,
            title: 'Pengumuman',
            subtitle: 'Riwayat pengumuman dari perusahaan',
          ),
          Obx(
            () => Skeletonizer(
              enabled: controller.isLoading.value,
              child: Cards.filled(
                context: context,
                color: theme.colorScheme.surfaceContainerLowest,
                child: Column(
                  children: [
                    Skeleton.shade(
                      child: _builderItemAnnouncement(),
                    ),
                    const SizedBox(height: 16),
                    Buttons.filledTonal(
                      width: double.infinity,
                      onPressed: controller.events.isNotEmpty
                          ? controller.moveToActivityHistory
                          : null,
                      icon: const Icon(Icons.arrow_forward_rounded),
                      iconAlignment: IconAlignment.end,
                      child: const Text('Lihat detail pengumuman'),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _builderItemHistory(RxList<EventsModel> events) {
    if (events.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final event = events.value[index];

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
                    newPattern: 'dd MMM, yyyy',
                    value: event.eventTime,
                  ) ??
                  '-- ---, ----',
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
        },
        itemCount: events.length,
      );
    }

    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 21),
      child: Text(
        'Belum ada riwayat aktivitas terakhir anda',
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _builderItemAnnouncement() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(ConstantsAssets.icAnnouncement),
          title: const Text('Perubahaan Jadwal Kerja Devisi Product'),
          subtitle: const Text('24 Sep, 2024'),
        );
      },
      itemCount: 3,
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

  Widget _builderCircleContainer({
    required BuildContext context,
    required Widget child,
    EdgeInsetsGeometry? margin,
    double? radiusCircular,
  }) {
    final theme = context.theme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radiusCircular ?? 0),
        border: Border.all(color: theme.hintColor),
      ),
      margin: margin,
      padding: const EdgeInsets.all(12),
      child: child,
    );
  }

  void _showModalShift(BuildContext context) {
    Modals.bottomSheet(
      context: context,
      content: const ShiftModal(),
      onClosePressed: controller.clearShift,
      actions: Column(
        children: [
          Obx(
            () => Buttons.filled(
              width: double.infinity,
              state: controller.isLoading.value,
              onPressed: (controller.shift.value != null)
                  ? controller.isAlreadyCheckin
                  : null,
              child: const Text('Mulai bekerja'),
            ),
          ),
          const SizedBox(height: 12),
          Buttons.text(
            width: double.infinity,
            onPressed: Get.back,
            child: const Text('Nanti saja'),
          ),
        ],
      ),
    );
  }
}
