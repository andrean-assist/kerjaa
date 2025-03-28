import 'package:assist_hadir/app/helpers/format_date_time.dart';
import 'package:assist_hadir/app/helpers/format_file_helper.dart';
import 'package:assist_hadir/app/modules/add_overtime/widget/modal/date_overtime_modal.dart';
import 'package:assist_hadir/app/modules/widgets/buttons/buttons.dart';
import 'package:assist_hadir/app/modules/widgets/card/cards.dart';
import 'package:assist_hadir/shared/shared_theme.dart';
import 'package:assist_hadir/utils/constants_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../utils/constants_strings.dart';
import '../../../helpers/validations.dart';
import '../../widgets/modal/modals.dart';
import '../../widgets/textform_fields/custom_textform_field_new.dart';
import '../controllers/add_overtime_controller.dart';

class AddOvertimeView extends GetView<AddOvertimeController> {
  const AddOvertimeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedTheme.dividerColor,
      appBar: AppBar(
        flexibleSpace: const FlexibleSpaceBar(
          title: Text('Buat Pengajuan'),
          centerTitle: false,
        ),
      ),
      body: _builderBody(context),
      bottomNavigationBar: BottomSheet(
        enableDrag: false,
        onClosing: () {},
        backgroundColor: SharedTheme.whiteColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        builder: (context) => Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 21),
          child: Opacity(
            opacity: 0.5,
            child: Buttons.filled(
              width: double.infinity,
              onPressed: controller.confirm,
              child: const Text('Simpan pengajuan'),
            ),
          ),
        ),
      ),
    );
  }

  Widget _builderBody(BuildContext context) {
    final textTheme = context.textTheme;
    return SingleChildScrollView(
      child: Column(
        spacing: 12,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            color: SharedTheme.whiteColor,
            child: Column(
              spacing: 12,
              children: [
                Obx(
                  () => (controller.overtimeEndDate.value == null)
                      ? _builderItemMenu(
                          textTheme: textTheme,
                          titleText: 'Jadwal Lembur',
                          subtitleText: 'Jadwal lembur belum dipilih',
                          isChip: true,
                          iconChip: Icons.error_rounded,
                          isButton: true,
                          onPressed: () =>
                              _showModalOvertimeSchedule(context: context),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: SharedTheme.dividerColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            leading: SvgPicture.asset(
                              ConstantsAssets.icDateOverTime,
                              width: 28,
                              height: 28,
                            ),
                            title: const Text('Jadwal lembur'),
                            titleTextStyle: textTheme.titleMedium?.copyWith(
                              fontWeight: SharedTheme.semiBold,
                            ),
                            subtitle: Text(
                              FormatDateTime.dateToString(
                                newPattern: 'dd MMMM yyyy',
                                value: controller.overtimeStartDate.value
                                    ?.toIso8601String(),
                              ),
                            ),
                            subtitleTextStyle: textTheme.bodySmall?.copyWith(
                              fontWeight: SharedTheme.medium,
                              color: SharedTheme.quertenaryTextColor,
                            ),
                            trailing: Buttons.outlined(
                              onPressed: () => _showModalOvertimeSchedule(
                                context: context,
                                isUpdate: true,
                              ),
                              child: const Text('Ganti'),
                            ),
                          ),
                        ),
                ),
                const Divider(),
                Obx(
                  () => (controller.selectedOvertimeType.value == null)
                      ? _builderItemMenu(
                          textTheme: textTheme,
                          titleText: 'Tipe Lembur',
                          subtitleText: 'Tipe lembur belum dipilih',
                          isChip: true,
                          iconChip: Icons.error_rounded,
                          isButton: true,
                          onPressed: () => _showModalTypeOvertime(context),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: SharedTheme.dividerColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            leading: SvgPicture.asset(
                              controller.listOvertimeType[controller
                                      .selectedOvertimeType.value!]['icon']
                                  .toString(),
                              width: 28,
                              height: 28,
                            ),
                            title: const Text('Tipe lembur'),
                            titleTextStyle: textTheme.titleMedium?.copyWith(
                              fontWeight: SharedTheme.semiBold,
                            ),
                            subtitle: Text(
                              '${controller.listOvertimeType[controller.selectedOvertimeType.value!]['title']}',
                            ),
                            subtitleTextStyle: textTheme.bodySmall?.copyWith(
                              fontWeight: SharedTheme.medium,
                              color: SharedTheme.quertenaryTextColor,
                            ),
                            trailing: Buttons.outlined(
                              onPressed: () => _showModalTypeOvertime(context),
                              child: const Text('Ganti'),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            color: SharedTheme.whiteColor,
            child: Obx(
              () => (controller.selectedShift.value == null)
                  ? _builderItemMenu(
                      textTheme: textTheme,
                      titleText: 'Shift',
                      subtitleText:
                          'Pilih shift yang sesuai dengan jadwal kerja Anda',
                      isChip: false,
                      isButton: true,
                      onPressed: () => _showModalShift(context),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: SharedTheme.dividerColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        leading: SvgPicture.asset(
                          controller.listShift[controller.selectedShift.value!]
                                  ['icon']
                              .toString(),
                          width: 28,
                          height: 28,
                        ),
                        title: Text(
                          controller.listShift[controller.selectedShift.value!]
                                  ['title']
                              .toString(),
                        ),
                        titleTextStyle: textTheme.titleMedium?.copyWith(
                          fontWeight: SharedTheme.semiBold,
                        ),
                        subtitle: Text(
                          '${controller.listShift[controller.selectedShift.value!]['subtitle']}',
                        ),
                        subtitleTextStyle: textTheme.bodySmall?.copyWith(
                          fontWeight: SharedTheme.medium,
                          color: SharedTheme.quertenaryTextColor,
                        ),
                        trailing: Buttons.outlined(
                          onPressed: () => _showModalShift(context),
                          child: const Text('Ganti'),
                        ),
                      ),
                    ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            color: SharedTheme.whiteColor,
            child: Obx(
              () => _builderItemMenu(
                textTheme: textTheme,
                titleText: 'Sebelum Shift',
                subtitleText: 'Lembur akan dimulai sebelum shift kerja',
                isChip: false,
                isButton: false,
                switchState: controller.beforeShift.value,
                onPressed: () =>
                    controller.setBeforeShift(!controller.beforeShift.value),
                onChanged: controller.setBeforeShift,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            color: SharedTheme.whiteColor,
            child: Obx(
              () => _builderItemMenu(
                textTheme: textTheme,
                titleText: 'Sesudah Shift',
                subtitleText:
                    'Lembur akan dimulai sesudah shift kerja berakhir',
                isChip: false,
                isButton: false,
                switchState: controller.afterShift.value,
                onPressed: () =>
                    controller.setAfterShift(!controller.afterShift.value),
                onChanged: controller.setAfterShift,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            color: SharedTheme.whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Lainnya',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: SharedTheme.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'File Pendukung',
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: SharedTheme.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Upload file pendukung untuk memudahkan pengajuan Anda',
                  style: textTheme.bodyMedium?.copyWith(
                    color: SharedTheme.quertenaryTextColor,
                  ),
                ),
                const SizedBox(height: 16),
                Obx(
                  () {
                    final file = controller.file.value;
                    if (file != null) {
                      return Container(
                        margin: const EdgeInsets.only(left: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  ConstantsAssets.icPDFFile,
                                ),
                                const SizedBox(width: 21),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 4,
                                  children: [
                                    Text(file.name),
                                    Text(
                                      '${FormatFileHelper.fileSize(
                                        file.size,
                                        decimals: 0,
                                      )}  •  ${file.extension} File',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Buttons.outlined(
                              onPressed: () {},
                              child: const Text('Ganti File'),
                            )
                          ],
                        ),
                      );
                    } else {
                      return Row(
                        children: [
                          Cards.filled(
                            context: context,
                            inPadding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 21,
                            ),
                            color: SharedTheme.bgTertiary,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: SharedTheme.lightIconColor,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const Icon(
                                    Icons.menu_rounded,
                                    color: SharedTheme.whiteColor,
                                    size: 18,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'No File',
                                  style: textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            spacing: 12,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                spacing: 8,
                                children: [
                                  Icon(
                                    Icons.circle_rounded,
                                    color: SharedTheme.filledBtnColor,
                                    size: 8,
                                  ),
                                  Text('Maksimal file 10 MB')
                                ],
                              ),
                              Buttons.outlined(
                                onPressed: () => _showModalPickFile(context),
                                child: const Text('Tambah file'),
                              ),
                            ],
                          )
                        ],
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormFieldNew(
                  controller: controller.reasonC,
                  focusNode: controller.reasonF,
                  labelText: ConstantsStrings.labelReason,
                  labelStyle: textTheme.titleSmall?.copyWith(
                    fontWeight: SharedTheme.semiBold,
                  ),
                  hintText: ConstantsStrings.hintReason,
                  isFilled: false,
                  keyboardType: TextInputType.multiline,
                  validator: (value) => Validation.formField(
                    value: value,
                    titleField: ConstantsStrings.labelReason,
                  ),
                  onFieldSubmitted: (_) => controller.confirm(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget testing() {
    return ListTile(
      leading: SvgPicture.asset(ConstantsAssets.icFolder),
      title: const Text('Nama file.pdf'),
      subtitle: const LinearProgressIndicator(),
      trailing: Buttons.outlined(
        onPressed: () {},
        child: const Text('Hapus'),
      ),
    );
  }

  Widget _builderItemMenu({
    required TextTheme textTheme,
    required String titleText,
    required String subtitleText,
    required bool isChip,
    required bool isButton,
    IconData? iconChip,
    Function()? onPressed,
    bool? switchState,
    Function(bool)? onChanged,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onPressed,
      splashColor: SharedTheme.filledBtnColor,
      title: Text(titleText),
      titleTextStyle: textTheme.titleSmall?.copyWith(
        fontWeight: SharedTheme.semiBold,
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isChip)
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Chip(
                  label: Text(
                    subtitleText,
                    style: textTheme.labelMedium?.copyWith(
                      fontWeight: SharedTheme.medium,
                      color: SharedTheme.textBtnColor,
                    ),
                  ),
                  avatar: Icon(
                    iconChip,
                    color: SharedTheme.textBtnColor,
                  ),
                  backgroundColor: SharedTheme.filledTonalBtnColor,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1000),
                  ),
                ),
              ),
            )
          else
            Expanded(
              child: Text(
                subtitleText,
                style: textTheme.bodySmall?.copyWith(
                  color: SharedTheme.quertenaryTextColor,
                ),
              ),
            ),
          const SizedBox(width: 12),
          if (isButton)
            Buttons.outlined(
              onPressed: onPressed,
              child: const Text('Tambah'),
            )
          else
            Switch(
              value: switchState ?? false,
              onChanged: onChanged,
              activeTrackColor: SharedTheme.filledBtnColor,
              activeColor: SharedTheme.whiteColor,
              inactiveThumbColor: SharedTheme.whiteColor,
              inactiveTrackColor: SharedTheme.inActiveColor,
              trackOutlineColor:
                  const WidgetStatePropertyAll(Colors.transparent),
            ),
        ],
      ),
    );
  }

  void _showModalOvertimeSchedule({
    required BuildContext context,
    bool isUpdate = false,
  }) {
    Modals.bottomSheet(
      context: context,
      content: DateOvertimeModal(isUpdate),
    ).whenComplete(
      () {
        if (controller.overtimeEndDate.value == null) {
          controller.overtimeStartDate.value = null;
        }
        controller.indexScreenOvertime.value = 0;
      },
    );
  }

  void _showModalTypeOvertime(BuildContext context) {
    final textTheme = context.textTheme;

    Modals.bottomSheetWithClose(
      context: context,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tipe Lembur',
              style: textTheme.titleLarge?.copyWith(
                fontSize: 18,
                fontWeight: SharedTheme.semiBold,
              ),
            ),
            const SizedBox(height: 32),
            ...controller.listOvertimeType.map(
              (e) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: SharedTheme.dividerColor),
                ),
                child: ListTile(
                  leading: SvgPicture.asset(
                    e['icon'].toString(),
                    width: 28,
                    height: 28,
                  ),
                  title: Text(e['title'].toString()),
                  onTap: () {
                    controller.selectedOvertimeType.value =
                        controller.listOvertimeType.indexOf(e);
                    Get.back();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showModalShift(BuildContext context) {
    final textTheme = context.textTheme;
    Modals.bottomSheetWithClose(
      context: context,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shift',
              style: textTheme.titleLarge?.copyWith(
                fontSize: 18,
                fontWeight: SharedTheme.semiBold,
              ),
            ),
            const SizedBox(height: 32),
            ...controller.listShift.map(
              (e) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: SharedTheme.dividerColor),
                ),
                child: ListTile(
                  leading: SvgPicture.asset(
                    e['icon'].toString(),
                    width: 28,
                    height: 28,
                  ),
                  title: Text('${e['title']} (${e['subtitle']})'),
                  titleTextStyle: textTheme.titleSmall
                      ?.copyWith(fontWeight: SharedTheme.semiBold),
                  onTap: () {
                    controller.selectedShift.value =
                        controller.listShift.indexOf(e);
                    Get.back();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showModalPickFile(BuildContext context) {
    final textTheme = context.textTheme;
    Modals.bottomSheetWithClose(
      context: context,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih pendukung',
              style: context.textTheme.titleLarge?.copyWith(
                fontSize: 18,
                fontWeight: SharedTheme.semiBold,
              ),
            ),
            const SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: SharedTheme.dividerColor),
              ),
              child: ListTile(
                leading: SvgPicture.asset(ConstantsAssets.icFolder),
                title: const Text('Pilih dari file'),
                titleTextStyle: textTheme.titleSmall
                    ?.copyWith(fontWeight: SharedTheme.semiBold),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: SharedTheme.lightIconColor,
                ),
                onTap: controller.pickFile,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
