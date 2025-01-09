import 'dart:io';

import 'package:dio/dio.dart';
import '../../app/modules/init/controllers/init_controller.dart';
import '../../utils/constants_connect.dart';
import 'package:path/path.dart' as p;

class AwsServices {
  final InitController _initC;
  late final Dio _dio;
  // late final Map<String, String> headers;

  AwsServices(this._initC) {
    _dio = Dio();
    // final token = _initC.localStorage.read<String>(ConstantsKeys.authToken);
    // headers = {
    //   // 'Accept': 'application/json',
    //   'ContentType': 'multipart/form-data',
    // };

    // if (token != null) {
    //   headers['Authorization'] = token;
    // }
  }

  Future<Response> uploadImage(String path) async {
    final filename = p.basename(path);
    return _dio.post(
      '${ConstantsConnect.endPointBaseUrlUpload}${ConstantsConnect.bucketUploadHospital}',
      data: FormData.fromMap(
        {
          filename: await MultipartFile.fromFile(path),
        },
      ),
    );
  }
}
