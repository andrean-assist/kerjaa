import 'package:get/get.dart';
import '../../app/modules/init/controllers/init_controller.dart';
import '../../utils/constants_connect.dart';
import '../../utils/constants_keys.dart';

class AwsServices extends GetConnect {
  final InitController _initC;
  late final Map<String, String> headers;

  AwsServices(this._initC) {
    final token = _initC.localStorage.read<String>(ConstantsKeys.authToken);
    headers = {
      'Accept': 'application/json',
    };

    if (token != null) {
      headers['Authorization'] = token;
    }
  }

  Future<Response> uploadImage(FormData form) => post(
        ConstantsConnect.endPointBaseUrlUpload,
        form,
        headers: headers,
      );
}
