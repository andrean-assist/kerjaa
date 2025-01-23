import 'dart:io';

import 'package:assist_hadir/app/data/model/user/user_model.dart';
import 'package:assist_hadir/services/aws/aws_services.dart';
import 'package:assist_hadir/services/profile/profile_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

import '../../../../utils/constants_keys.dart';
import '../../init/controllers/init_controller.dart';
import '../../widgets/snackbar/snackbar.dart';

class EditProfileController extends GetxController {
  late final InitController _initC;
  late final AwsServices _awsS;
  late final ProfileServices _profileS;

  final formKey = GlobalKey<FormState>();
  final fullNameC = TextEditingController();
  final positionC = TextEditingController();
  final emailC = TextEditingController();

  UserModel? userModel;

  final imageFile = Rxn<XFile>();

  final isLoading = false.obs;
  final isEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    _awsS = AwsServices(_initC);
    _profileS = ProfileServices(_initC);
    _initListenerC();

    userModel = Get.arguments as UserModel?;
    fullNameC.text = userModel?.name ?? '';
    positionC.text = userModel?.position ?? '';
    emailC.text = userModel?.email ?? '';
  }

  void _initListenerC() {
    fullNameC.addListener(_changeEnabled);
    emailC.addListener(_changeEnabled);
  }

  void _changeEnabled() {
    isEnabled.value = fullNameC.text.isNotEmpty && emailC.text.isNotEmpty;
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();

    try {
      final xFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 60,
      );

      print('xFile = ${xFile?.path}');

      if (xFile != null) {
        imageFile.value = await setImageOrientationToPortrait(xFile);
      }

      print('pathImageFile = ${imageFile.value?.path}');
    } catch (e) {
      imageFile.value = null;
      _initC.logger.e('Error: $e');
    }
  }

  Future<XFile?> setImageOrientationToPortrait(XFile imageFile) async {
    try {
      final image = img.decodeJpg(await imageFile.readAsBytes());

      if (image != null) {
        final orientedImage = img.copyRotate(image, angle: 0);
        return XFile.fromData(img.encodeJpg(orientedImage));
        // await imageFile.writeAsBytes();
      }
    } catch (e) {
      _initC.logger.e('Error: setImageOrientationToPortrait = $e');
    }

    return null;
  }

  Future<void> save() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(Get.context!).unfocus();
    _updateProfile();
  }

  Future<String?> _uploadImage(String? path) async {
    if (path == null) return null;

    print('path = $path');

    final res = await _awsS.uploadImage(path);

    print('res statusCode = ${res.statusCode}');
    print('res data = ${res.data}');

    if (res.statusCode == HttpStatus.ok) {
      return res.data;
    }

    return null;
  }

  Future<void> _updateProfile() async {
    isLoading.value = true;

    try {
      final fileName = await _uploadImage(imageFile.value?.path);

      print('fileName from API = $fileName');

      final body = {
        "position": positionC.text.toString().trim(),
        "name": fullNameC.text.toString().trim(),
      };

      if (fileName != null) {
        body.addAll({"avatar": fileName});
      }

      final res = await _profileS.updateProfile(body);

      print('res body  ${res.body}');

      if (res.isOk) {
        _updateDataProfileInLocal(fileName);

        Snackbar.success(
          context: Get.context!,
          content: 'Berhasil mengedit data profile',
        );

        Get.back(result: true);
      } else {
        _initC.handleError(status: res.status, onLoad: _updateProfile);

        // if (res.statusCode == HttpStatus.unauthorized) {
        //   _initC.redirectLogout(Get.context!);
        // } else {
        //   _initC.showDialogFailed(
        //     onPressed: () {
        //       FocusScope.of(Get.context!).unfocus();
        //       Get.back();
        //       _updateProfile();
        //     },
        //   );
        // }
      }
    } on DioException catch (e) {
      _initC.logger.e('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void _updateDataProfileInLocal(String? fileName) {
    _initC.localStorage
      ..write(ConstantsKeys.name, fullNameC.text.toString().trim())
      ..write(ConstantsKeys.position, positionC.text.toString().trim());

    if (fileName != null) {
      _initC.localStorage.write(ConstantsKeys.profilPicture, fileName);
    }
  }
}
