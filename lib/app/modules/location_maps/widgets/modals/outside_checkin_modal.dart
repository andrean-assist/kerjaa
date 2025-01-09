import 'package:assist_hadir/app/modules/location_maps/controllers/location_maps_controller.dart';
import 'package:assist_hadir/app/modules/widgets/textform_fields/custom_textform_field_new.dart';
import 'package:assist_hadir/shared/shared_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants_assets.dart';
import '../../../../helpers/validations.dart';

class OutsideCheckinModal extends GetView<LocationMapsController> {
  final TextEditingController reasonC;

  const OutsideCheckinModal(this.reasonC, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            ConstantsAssets.imgOutsideRadius,
            height: 250,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 24),
          Text(
            'Lokasi Anda diluar radius kerja',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: SharedTheme.semiBold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            'Kami mendeteksi Anda berada di luar area kerja yang di tentukan. Mohon berikan alasan keberadaan Anda saat ini untuk di tinjau supervisor',
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: SharedTheme.medium,
              color: theme.hintColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Form(
            key: controller.formKey,
            child: CustomTextFormFieldNew(
              controller: reasonC,
              labelText: 'Catatan',
              isRequired: true,
              isFilled: false,
              hintText: 'cth: meeting di luar kantor',
              validator: (value) => Validation.formField(
                value: value,
                titleField: 'Catatan',
                isRequired: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
