import 'package:assist_hadir/app/modules/widgets/modal/modals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../shared/shared_theme.dart';
import '../../../../utils/constants_assets.dart';
import '../../../../utils/constants_strings.dart';
import '../../../helpers/format_file_helper.dart';
import '../../../helpers/validations.dart';
import '../../add_overtime/widget/modal/date_overtime_modal.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/card/cards.dart';
import '../../widgets/textform_fields/custom_textform_field_new.dart';
import '../controllers/add_leave_controller.dart';

class AddLeaveView extends GetView<AddLeaveController> {
  const AddLeaveView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedTheme.dividerColor,
      appBar: AppBar(
        title: const Text('Buat pengajuan'),
        centerTitle: false,
      ),
      body: _builderBody(context),
      bottomNavigationBar: _builderBottomSheet(),
    );
  }

  Widget _builderBody(BuildContext context) {
    final textTheme = context.textTheme;
    final width = context.mediaQuerySize.width;

    return SingleChildScrollView(
      child: Column(
        spacing: 12,
        children: [
          _builderLeaveType(textTheme, width),
          Container(
            padding: const EdgeInsets.all(24),
            color: SharedTheme.whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 24,
              children: [
                Text(
                  'Periode cuti',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: SharedTheme.bold,
                  ),
                ),
                Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: CustomTextFormFieldNew(
                        controller: controller.leavePeriodStartDateC,
                        labelText: 'Dari',
                        isFilled: false,
                        isReadOnly: true,
                        onTap: () => _showModalLeavePeriod(context: context),
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormFieldNew(
                        controller: controller.leavePeriodEndDateC,
                        labelText: 'Hingga',
                        isFilled: false,
                        isReadOnly: true,
                        onTap: () => _showModalLeavePeriod(
                          context: context,
                          isEndDate: true,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          _builderUploadFile(textTheme, context),
        ],
      ),
    );
  }

  Widget _builderLeaveType(TextTheme textTheme, double width) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: SharedTheme.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jenis cuti',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: SharedTheme.bold,
            ),
          ),
          const SizedBox(height: 20),
          CustomTextFormFieldNew(
            controller: controller.leaveTypeC,
            labelText: 'Jenis cuti',
            hintText: 'Pilih jenis cuti',
            isFilled: false,
            isReadOnly: true,
            suffixIcon: ObxValue(
              (state) => Icon(
                state.value
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
              ),
              controller.isShowModalLeaveType,
            ),
            onTap: () => _showBottomSheetLeaveType(width, textTheme),
          ),
        ],
      ),
    );
  }

  List<Widget> _builderLeaveForm({
    required BuildContext context,
    bool isDropdown = false,
    bool isDoubleTextField = false,
  }) {
    final textTheme = context.textTheme;
    final width = context.mediaQuerySize.width;

    final widgets = <Widget>[];

    if (isDropdown) {
      final widget = Container(
        padding: const EdgeInsets.all(24),
        color: SharedTheme.whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jenis cuti',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: SharedTheme.bold,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextFormFieldNew(
              controller: controller.leaveTypeC,
              labelText: 'Jenis cuti',
              hintText: 'Pilih jenis cuti',
              isFilled: false,
              isReadOnly: true,
              suffixIcon: ObxValue(
                (state) => Icon(
                  state.value
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                ),
                controller.isShowModalLeaveType,
              ),
              onTap: () => _showBottomSheetLeaveType(width, textTheme),
            ),
          ],
        ),
      );
      widgets.add(widget);
    }

    if (isDoubleTextField) {}

    return widgets;
  }

  Widget _builderUploadFile(TextTheme textTheme, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: SharedTheme.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Detail cuti',
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
                          onPressed: () {},
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
            onFieldSubmitted: (_) => controller.reasonF.requestFocus(),
          ),
          const SizedBox(height: 20),
          // CustomTextFormFieldNew(
          //   controller: controller.delegationC,
          //   focusNode: controller.delegationF,
          //   labelText: ConstantsStrings.labelReason,
          //   labelStyle: textTheme.titleSmall?.copyWith(
          //     fontWeight: SharedTheme.semiBold,
          //   ),
          //   hintText: ConstantsStrings.hintReason,
          //   isFilled: false,
          //   keyboardType: TextInputType.multiline,
          //   validator: (value) => Validation.formField(
          //     value: value,
          //     titleField: ConstantsStrings.labelReason,
          //   ),
          //   onFieldSubmitted: (_) => controller.confirm(),
          // ),
        ],
      ),
    );
  }

  Widget _builderBottomSheet() {
    return BottomSheet(
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
            onPressed: () {},
            child: const Text('Simpan pengajuan'),
          ),
        ),
      ),
    );
  }

  void _showBottomSheetLeaveType(double width, TextTheme textTheme) {
    controller.isShowModalLeaveType.value = true;

    Modals.bottomSheetWithClose(
      context: Get.context!,
      content: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: SharedTheme.dividerDragColor,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Pilih pengajuan',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: SharedTheme.semiBold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 32),
            ...controller.listRequest.map(
              (e) => ListTile(
                leading: SvgPicture.asset(ConstantsAssets.icListRequest),
                title: Text(e),
                trailing: const Icon(Icons.arrow_forward_rounded),
                contentPadding: const EdgeInsets.all(12),
                // onTap: () => controller.moveToAddLeave(),
              ),
            )
          ],
        ),
      ),
    ).whenComplete(
      () => controller.isShowModalLeaveType.value = false,
    );
  }

  void _showModalLeavePeriod({
    required BuildContext context,
    bool isEndDate = false,
  }) {
    Modals.bottomSheet(
      context: context,
      content: DateOvertimeModal(isEndDate),
    ).whenComplete(
      () {
        // if (controller.leaveEndDate.value == null) {
        //   controller.leaveStartDate.value = null;
        // }
      },
    );
  }
}
