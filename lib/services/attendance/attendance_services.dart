import 'package:get/get.dart';
import '../../app/modules/init/controllers/init_controller.dart';
import '../../utils/constants_connect.dart';
import '../../utils/constants_keys.dart';

class AttendanceServices extends GetConnect {
  final InitController _initC;
  late final Map<String, String> headers;

  AttendanceServices(this._initC) {
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

  Future<Response> createAttendance(Map data) => post(
        'Attendances/createAttendance',
        data,
        headers: headers,
      );

  Future<Response> updateAttendance(Map data) => put(
        'Attendances/updateAttendance',
        data,
        headers: headers,
      );
}
