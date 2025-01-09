import 'package:assist_hadir/app/data/model/attendance/res/data/data_attendance_model.dart';
import 'package:assist_hadir/app/data/model/organization/organization_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_new_dashboard_model.freezed.dart';
part 'data_new_dashboard_model.g.dart';

@freezed
class DataNewDashboardModel with _$DataNewDashboardModel {
  const factory DataNewDashboardModel({
    OrganizationModel? organization,
    DataAttendanceModel? attendance,
  }) = _DataNewDashboardModel;

  factory DataNewDashboardModel.fromJson(Map<String, Object?> json) =>
      _$DataNewDashboardModelFromJson(json);
}
