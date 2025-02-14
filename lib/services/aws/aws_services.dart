import 'package:dio/dio.dart';
import '../../utils/constants_connect.dart';
import 'package:path/path.dart' as p;

class AwsServices {
  late final Dio _dio;

  AwsServices() {
    _dio = Dio();
  }

  Future<Response> uploadImage(String path) async {
    final filename = p.basename(path);
    // final appEnv = dotenv.get('APP_ENVIRONMENT');
    // print('appENV = $appEnv');

    // final bucket = switch (appEnv) {
    //   'development' || 'local' => ConstantsConnect.bucketUploadDev,
    //   'production' => ConstantsConnect.bucketUpload,
    //   _ => ConstantsConnect.bucketUploadDev,
    // };

    // print('bucket = $bucket');

    return _dio.post(
      '${ConstantsConnect.endPointBaseUrlUpload}${ConstantsConnect.bucketUpload}',
      data: FormData.fromMap(
        {
          filename: await MultipartFile.fromFile(path),
        },
      ),
    );
  }
}
