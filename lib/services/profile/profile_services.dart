import 'package:get/get.dart';
import '../../app/modules/init/controllers/init_controller.dart';
import '../../utils/constants_connect.dart';
import '../../utils/constants_keys.dart';

class ProfileServices extends GetConnect {
  final InitController _initC;
  late final Map<String, String> headers;

  ProfileServices(this._initC) {
    final token = _initC.localStorage.read<String>(ConstantsKeys.authToken);
    headers = {
      'Accept': 'application/json',
    };

    if (token != null) {
      headers['Authorization'] = token;
    }
  }

  @override
  String? get baseUrl => ConstantsConnect.endPointBaseUrl;

  Future<Response> updateProfile(Map<String, dynamic> body) => put(
        'UserAccounts/updateDetail',
        body,
        headers: headers,
      );
}
