import 'package:assist_hadir/app/modules/add_overtime/widget/modal/date_overtime_modal.dart';
import 'package:assist_hadir/app/modules/widgets/buttons/buttons.dart';
import 'package:assist_hadir/app/modules/widgets/card/cards.dart';
import 'package:assist_hadir/shared/shared_theme.dart';
import 'package:flutter/material.dart';

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
    final textTheme = context.textTheme;

    return Scaffold(
      backgroundColor: SharedTheme.dividerColor,
      appBar: AppBar(
        title: const Text('Buat Pengajuan'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 12,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              color: SharedTheme.whiteColor,
              child: Column(
                spacing: 12,
                children: [
                  _builderItemMenu(
                    textTheme: textTheme,
                    titleText: 'Jadwal Lembur',
                    subtitleText: 'Jadwal lembur belum dipilih',
                    isChip: true,
                    iconChip: Icons.error_rounded,
                    isButton: true,
                    onPressed: () => _showModalOvertime(context, false),
                  ),
                  const Divider(),
                  _builderItemMenu(
                    textTheme: textTheme,
                    titleText: 'Tipe Lembur',
                    subtitleText: 'Tipe lembur belum dipilih',
                    isChip: true,
                    iconChip: Icons.error_rounded,
                    isButton: true,
                    onPressed: () => _showModalOvertime(context, true),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              color: SharedTheme.whiteColor,
              child: _builderItemMenu(
                textTheme: textTheme,
                titleText: 'Shift',
                subtitleText:
                    'Pilih shift yang sesuai dengan jadwal kerja Anda',
                isChip: false,
                isButton: true,
                onPressed: () {},
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
                  Row(
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
                                color: SharedTheme.quertenaryTextColor,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: const Icon(
                                Icons.menu_rounded,
                                color: SharedTheme.whiteColor,
                              ),
                            ),
                            const Text('No File'),
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
                            onPressed: () {},
                            child: const Text('Tambah file'),
                          ),
                        ],
                      )
                    ],
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

            // ListTile(
            //   contentPadding: EdgeInsets.zero,
            //   title: const Text('Durasi Istirahat'),
            //   titleTextStyle: textTheme.titleSmall?.copyWith(
            //     fontWeight: SharedTheme.semiBold,
            //   ),
            //   subtitle: Wrap(
            //     spacing: 12,
            //     children: controller.listBreakDuration.map(
            //       (e) {
            //         final index = controller.listBreakDuration.indexOf(e);
            //         return Buttons.outlined(
            //           onPressed: () =>
            //               index != controller.currentBreakDuration.value
            //                   ? controller.changeCurrentBreakDuration(index)
            //                   : null,
            //           child: Text(e),
            //         );
            //       },
            //     ).toList(),
            //   ),
            // )
          ],
        ),
      ),
      persistentFooterButtons: [
        Opacity(
          opacity: 0.5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Buttons.filled(
              width: double.infinity,
              onPressed: controller.confirm,
              child: const Text('Simpan pengajuan'),
            ),
          ),
        ),
      ],
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

  void _showModalOvertime(BuildContext context, bool isTimeOff) {
    Modals.bottomSheet(
      context: context,
      content: DateOvertimeModal(isTimeOff),
      // actions: Buttons.filled(
      //   width: double.infinity,
      //   onPressed: () {},
      //   child: const Text('Konfirmasi'),
      // ),
    );
  }
}
