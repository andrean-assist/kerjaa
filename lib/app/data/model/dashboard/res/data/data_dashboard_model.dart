import 'package:assist_hadir/app/data/model/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../attendance/res/data/data_attendance_model.dart';
import '../../../organization/organization_model.dart';

part 'data_dashboard_model.freezed.dart';
part 'data_dashboard_model.g.dart';

@freezed
class DataDashboardModel with _$DataDashboardModel {
  const factory DataDashboardModel({
    DataAttendanceModel? attendance,
    OrganizationModel? organization,
    UserModel? user,
  }) = _DataDashboardModel;

  factory DataDashboardModel.fromJson(Map<String, Object?> json) =>
      _$DataDashboardModelFromJson(json);
}
