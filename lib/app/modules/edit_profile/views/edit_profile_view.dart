import 'dart:io';

import 'package:assist_hadir/app/modules/widgets/textform_fields/custom_textform_field_new.dart';
import 'package:assist_hadir/utils/constants_assets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../shared/shared_theme.dart';
import '../../widgets/buttons/buttons.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detail Data Karyawan',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: SharedTheme.bold,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Foto',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: SharedTheme.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Upload foto karyawan.',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              _builderAvatar(),
              const SizedBox(height: 12),
              TextButton(
                onPressed: controller.pickImage,
                child: const Text('Tambah Foto'),
              ),
              const SizedBox(height: 24),
              CustomTextFormFieldNew(
                controller: controller.fullNameC,
                labelText: 'Nama',
                isFilled: false,
                isRequired: true,
              ),
              const SizedBox(height: 24),
              CustomTextFormFieldNew(
                controller: controller.positionC,
                labelText: 'Posisi',
                isFilled: false,
                isRequired: true,
              ),
              const SizedBox(height: 24),
              CustomTextFormFieldNew(
                controller: controller.emailC,
                labelText: 'Email',
                isFilled: false,
                isRequired: true,
                isEnable: false,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
        child: Obx(
          () => Buttons.filled(
            width: double.infinity,
            state: controller.isLoading.value,
            onPressed: controller.save,
            child: const Text('Simpan'),
          ),
        ),
      ),
    );
  }

  Widget _builderAvatar() {
    return Obx(
      () {
        ImageProvider fgImage;
        final avatar = controller.userModel?.avatar;

        // jika foto hasi dari picker
        if (controller.imageFile.value != null) {
          fgImage = FileImage(File(controller.imageFile.value!.path));
        } else if (avatar != null) {
          fgImage = NetworkImage(avatar);
        } else {
          fgImage = const AssetImage(ConstantsAssets.imgNoPhoto);
        }

        return CircleAvatar(
          foregroundImage: fgImage,
          radius: 21,
        );
      },
    );
  }
}
