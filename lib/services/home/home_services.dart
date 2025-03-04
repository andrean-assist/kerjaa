import 'package:get/get.dart';
import '../../app/modules/init/controllers/init_controller.dart';
import '../../utils/constants_connect.dart';
import '../../utils/constants_keys.dart';

class HomeServices extends GetConnect {
  final InitController _initC;
  late final Map<String, String> headers;

  HomeServices(this._initC) {
    final token = _initC.localStorage.read<String>(ConstantsKeys.authToken);
    headers = {
      'Accept': 'application/json',
    };

    if (token != null) {
      headers['Authorization'] = token;
    }

    print('token = $token');
  }

  @override
  String? get baseUrl => ConstantsConnect.endPointBaseUrl;

  Future<Response> dashboard({required String organizationId}) => get(
        'Attendances/dashboard',
        headers: headers,
        query: {'organizationId': organizationId},
      );

  Future<Response> attendances(Map<String, dynamic> query) => get(
        'Attendances/listAttendance',
        headers: headers,
        query: query,
      );

  Future<Response> isAlreadyCheckedIn(Map<String, dynamic> query) => get(
        'Attendances/isAlreadyCheckedIn',
        headers: headers,
        query: query,
      );
}
