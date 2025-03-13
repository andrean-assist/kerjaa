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
      body: NestedScrollView(
        controller: controller.scrollC,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          _builderAppBar(),
        ],
        body: _builderBody(context),
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
    return RefreshIndicator.adaptive(
      onRefresh: controller.fetchDashboard,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                color: SharedTheme.filledBtnColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(62),
                  bottomRight: Radius.circular(62),
                ),
              ),
            ),
            Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _builderGreetingMessage(textTheme),
                _builderListHeaderCard(context),
                _builderMenu(context),
                _builderAttributesCard(context),
                _builderLastHistory(context),
                _builderAnnouncement(context),
                const SizedBox(height: 162),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _builderGreetingMessage(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
              textColor: SharedTheme.whiteColor,
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
    Color? textColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          title,
          style: textTheme.titleLarge?.copyWith(
            fontWeight: SharedTheme.bold,
            fontSize: 20,
            color: textColor,
          ),
        ),
        const SizedBox(height: 4),
        AutoSizeText(
          subtitle,
          style: textTheme.bodySmall?.copyWith(
            color: textColor,
          ),
        ),
      ],
    );
  }

  Widget _builderListHeaderCard(BuildContext context) {
    return Obx(
      () => Skeletonizer(
        enabled: controller.isLoading.value,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
            final maxWidthShift = maxWidth / 1.3;

            final organization = controller.dataDashboard?.organization;
            final isShift = organization?.isShift;
            final shift = organization?.shift;
            final haveShift = shift != null && isShift != null && isShift;
            final isGeneral = shift != null && shift.general != null;

            const outPadding = EdgeInsets.symmetric(horizontal: 16);

            // cek apakah non-shift
            if (isGeneral) {
              final generalAbsen = shift.general?.absen;
              return _builderHeaderCard(
                context: context,
                isShift: isShift,
                outPadding: outPadding,
                shiftType: 'general',
                shiftText: _textShiftMessage(
                  start: generalAbsen?.start,
                  end: generalAbsen?.end,
                ),
              );
            }

            // cek apakah shift aktif
            if (haveShift) {
              final pagi = shift.pagi;
              final siang = shift.siang;
              final malam = shift.malam;
              final isShiftPagiDisabled =
                  pagi != null && (pagi.disabledShift ?? true);
              final isShiftSiangDisabled =
                  siang != null && (siang.disabledShift ?? true);
              final isShiftMalamDisabled =
                  malam != null && (malam.disabledShift ?? true);

              final pagiAbsen = shift.pagi?.absen;
              final siangAbsen = shift.siang?.absen;
              final malamAbsen = shift.malam?.absen;

              final enabledShifts = [
                !isShiftPagiDisabled,
                !isShiftSiangDisabled,
                !isShiftMalamDisabled
              ].where((enabled) => enabled).length;

              if (enabledShifts == 1) {
                if (!isShiftPagiDisabled) {
                  return _builderHeaderCard(
                    context: context,
                    isShift: isShift,
                    outPadding: outPadding,
                    shiftType: 'pagi',
                    shiftText: _textShiftMessage(
                        start: pagiAbsen?.start, end: pagiAbsen?.end),
                  );
                } else if (!isShiftSiangDisabled) {
                  return _builderHeaderCard(
                    context: context,
                    isShift: isShift,
                    outPadding: outPadding,
                    shiftType: 'siang',
                    shiftText: _textShiftMessage(
                        start: siangAbsen?.start, end: siangAbsen?.end),
                  );
                } else if (!isShiftMalamDisabled) {
                  return _builderHeaderCard(
                    context: context,
                    isShift: isShift,
                    outPadding: outPadding,
                    shiftType: 'malam',
                    shiftText: _textShiftMessage(
                      start: malamAbsen?.start,
                      end: malamAbsen?.end,
                    ),
                  );
                }
              } else {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () {
                      return Row(
                        children: [
                          Visibility(
                            visible: !isShiftPagiDisabled,
                            child: _builderHeaderCard(
                              context: context,
                              width: maxWidthShift,
                              outPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              isShift: isShift,
                              shiftType: 'pagi',
                              shiftText: _textShiftMessage(
                                start: pagiAbsen?.start,
                                end: pagiAbsen?.end,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !isShiftSiangDisabled,
                            child: _builderHeaderCard(
                              context: context,
                              width: maxWidthShift,
                              isShift: isShift,
                              shiftType: 'siang',
                              shiftText: _textShiftMessage(
                                start: siangAbsen?.start,
                                end: siangAbsen?.end,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !isShiftMalamDisabled,
                            child: _builderHeaderCard(
                              context: context,
                              width: maxWidthShift,
                              outPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              isShift: isShift,
                              shiftType: 'malam',
                              shiftText: _textShiftMessage(
                                start: malamAbsen?.start,
                                end: malamAbsen?.end,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }
            }

            return _builderDisabledShift(context: context);
          },
        ),
      ),
    );
  }

  Widget _builderHeaderCard({
    required BuildContext context,
    double? width,
    EdgeInsets? outPadding,
    required bool? isShift,
    required String shiftType,
    required String shiftText,
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
        width: width ?? double.infinity,
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
                shiftText,
                style: textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              _builderBtnAbsence(context, shiftType, isShift),
            ],
          ),
        ),
      ),
    );
  }

  Widget _builderDisabledShift({required BuildContext context, double? width}) {
    final textTheme = context.textTheme;
    final size = context.mediaQuerySize;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      width: width ?? double.infinity,
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

  Widget _builderBtnAbsence(BuildContext context, String shiftType,
      [bool? isShift = false]) {
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

        ButtonType buttonType = ButtonType.filled;
        String textBtn = 'Check in';

        // jika user sudah melakukan absensi maka tombol checkout tampil
        // dan tombol slide memulai istirahat juga tampil dengan posisi ke kiri atau 0
        if (startTime != null) {
          statusAbsence = StatusAbsenceSetup.checkOut;
          buttonType = ButtonType.filledTonal;
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
                  type: buttonType,
                  width: double.infinity,
                  onPressed: () {
                    if (statusAbsence == StatusAbsenceSetup.checkIn) {
                      if (isShift ?? false) {
                        // _showModalShift(context);
                        controller.setShift(shiftType);
                        controller.isAlreadyCheckin();
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
      inPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                  menu.iconPath,
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
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
          Obx(
            () => Skeletonizer(
              enabled: controller.isLoading.value,
              child: Cards.filled(
                context: context,
                color: theme.colorScheme.surfaceContainerLowest,
                inPadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Skeleton.shade(
                      child: _builderItemHistory(
                          context: context, events: controller.events),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Buttons.filledTonal(
                        width: double.infinity,
                        onPressed: controller.events.isNotEmpty
                            ? controller.moveToActivityHistory
                            : null,
                        icon: const Icon(
                          Icons.arrow_forward_rounded,
                          color: SharedTheme.textBtnColor,
                        ),
                        iconAlignment: IconAlignment.end,
                        child: const Text('Lihat detail aktivitas'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                inPadding: EdgeInsets.zero,
                child: Column(
                  spacing: 16,
                  children: [
                    Skeleton.shade(
                      child: _builderItemAnnouncement(textTheme),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Buttons.filledTonal(
                        width: double.infinity,
                        onPressed: controller.events.isNotEmpty
                            ? controller.moveToActivityHistory
                            : null,
                        icon: const Icon(
                          Icons.arrow_forward_rounded,
                          color: SharedTheme.textBtnColor,
                        ),
                        iconAlignment: IconAlignment.end,
                        child: const Text('Lihat detail pengumuman'),
                      ),
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

  Widget _builderItemHistory({
    required BuildContext context,
    required RxList<EventsModel> events,
  }) {
    final textTheme = context.textTheme;
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
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            leading: (assetIcon != null) ? SvgPicture.asset(assetIcon) : null,
            title: Text(type),
            titleTextStyle: textTheme.titleSmall?.copyWith(
              fontWeight: SharedTheme.semiBold,
            ),
            subtitle: Text(
              FormatDateTime.dateToString(
                    newPattern: 'dd MMM, yyyy',
                    value: event.eventTime,
                  ) ??
                  '-- ---, ----',
            ),
            subtitleTextStyle: textTheme.bodyMedium?.copyWith(
              fontWeight: SharedTheme.medium,
              color: SharedTheme.quertenaryTextColor,
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
                  style: textTheme.labelLarge?.copyWith(
                    fontWeight: SharedTheme.semiBold,
                  ),
                ),
                _builderState(context, event),
              ],
            ),
            shape: const Border(
              bottom: BorderSide(color: SharedTheme.dividerColor),
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

  Widget _builderItemAnnouncement(TextTheme textTheme) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final dummyItem = controller.dummyListAnnouncement[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          leading: SvgPicture.asset(ConstantsAssets.icAnnouncement),
          title: Text(dummyItem['title'].toString()),
          titleTextStyle:
              textTheme.titleSmall?.copyWith(fontWeight: SharedTheme.semiBold),
          subtitle: const Text('24 Sep, 2024'),
          subtitleTextStyle: textTheme.bodyMedium?.copyWith(
            fontWeight: SharedTheme.medium,
            color: SharedTheme.quertenaryTextColor,
          ),
          shape: const Border(
            bottom: BorderSide(color: SharedTheme.dividerColor),
          ),
        );
      },
      itemCount: controller.dummyListAnnouncement.length,
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
        style: textTheme.labelMedium?.copyWith(
          color: theme.colorScheme.surface,
          height: 1.5,
        ),
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

  // void _showModalShift(BuildContext context) {
  //   Modals.bottomSheetWithClose(
  //     context: context,
  //     content: const ShiftModal(),
  //     onClosePressed: controller.clearShift,
  //     actions: Column(
  //       children: [
  //         Obx(
  //           () => Buttons.filled(
  //             width: double.infinity,
  //             state: controller.isLoading.value,
  //             onPressed: (controller.shift.value != null)
  //                 ? controller.isAlreadyCheckin
  //                 : null,
  //             child: const Text('Mulai bekerja'),
  //           ),
  //         ),
  //         const SizedBox(height: 12),
  //         Buttons.text(
  //           width: double.infinity,
  //           onPressed: Get.back,
  //           child: const Text('Nanti saja'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  String _textShiftMessage({required String? start, required String? end}) {
    return 'Shift ${start ?? '--:--'} WIB to ${end ?? '--:--'} WIB';
  }
}
