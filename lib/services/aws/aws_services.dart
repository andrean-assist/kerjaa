import 'package:dio/dio.dart';
import '../../app/modules/init/controllers/init_controller.dart';
import '../../utils/constants_connect.dart';
import 'package:path/path.dart' as p;

class AwsServices {
  final InitController _initC;
  late final Dio _dio;

  AwsServices(this._initC) {
    _dio = Dio();
  }

  Future<Response> uploadImage(String path) async {
    final filename = p.basename(path);
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
