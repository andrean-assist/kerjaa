import 'dart:io';

import 'package:assist_hadir/app/data/model/user/user_model.dart';
import 'package:assist_hadir/services/aws/aws_services.dart';
import 'package:assist_hadir/services/profile/profile_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

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

    userModel = Get.arguments as UserModel?;
    fullNameC.text = userModel?.name ?? '';
    positionC.text = userModel?.position ?? '';
    emailC.text = userModel?.email ?? '';
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    try {
      imageFile.value = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 60,
      );
      print('pathImageFile = ${imageFile.value?.path}');
    } catch (e) {
      _initC.logger.e('Error: $e');
    }
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

    final filename = p.basename(path);
    final filenameWithoutExt = p.basenameWithoutExtension(path);

    final multipart = MultipartFile(
      File(path),
      filename: filenameWithoutExt,
      // contentType: ContentType.binary.value,
    );

    print('fileName: $filename');

    final formData = FormData({filename: multipart});
    final res = await _awsS.uploadImage(formData);

    print('res statusCode = ${res.statusCode}');
    print('res body = ${res.body}');
    print('res isOK = ${res.isOk}');
    print('res headers = ${res.headers?.values.join(',')}');

    if (res.isOk) {
      final bodyFilename = res.bodyString;
      return bodyFilename;
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
        if (res.statusCode == HttpStatus.unauthorized) {
          _initC.redirectLogout(Get.context!);
        } else {
          _initC.showDialogFailed(
            onPressed: () {
              FocusScope.of(Get.context!).unfocus();
              Get.back();
              _updateProfile();
            },
          );
        }
      }
    } on GetHttpException catch (e) {
      _initC.logger.e('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void _updateDataProfileInLocal(String? fileName) {
    _initC.localStorage
      ..write(ConstantsKeys.name, fullNameC.text.toString().trim())
      ..write(ConstantsKeys.position, positionC.text.toString().trim())
      ..write(ConstantsKeys.profilPicture, fileName);
  }
}
