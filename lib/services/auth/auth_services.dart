import 'package:get/get.dart';
import '../../app/modules/init/controllers/init_controller.dart';
import '../../utils/constants_connect.dart';
import '../../utils/constants_keys.dart';

class AuthServices extends GetConnect {
  final InitController _initC;

  late final Map<String, String> headers;

  AuthServices(this._initC) {
    final token = _initC.localStorage.read<String>(ConstantsKeys.authToken);

    headers = {
      'Accept': 'application/json',
    };

    if (token != null) {
      headers['Authorization'] = token;
    }
  }

  @override
  void onInit() {
    httpClient.addRequestModifier<dynamic>((request) {
      print('Request: ${request.method} ${request.url}');
      return request;
    });

    httpClient.addResponseModifier<dynamic>((request, response) {
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');
      return response;
    });
    // super.onInit();
  }

  @override
  String? get baseUrl => ConstantsConnect.endPointBaseUrl;

  Future<Response> login(Map data) => post(
        'UserAccounts/login',
        data,
        headers: headers,
      );

  Future<Response> registerFace(Map data) => put(
        'UserAccounts/verify',
        data,
        headers: headers,
      );
}
