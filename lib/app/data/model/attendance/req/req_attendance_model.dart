import 'package:freezed_annotation/freezed_annotation.dart';

import '../../verifications/verifications_model.dart';

part 'req_attendance_model.freezed.dart';
part 'req_attendance_model.g.dart';

@freezed
class ReqAttendanceModel with _$ReqAttendanceModel {
  const factory ReqAttendanceModel({
    required String? userId,
    required String? organizationId,
    required String? date,
    String? shift,
    String? type,
    String? userReasonLocation,
    @JsonKey(includeIfNull: false) String? attendanceId,
    @JsonKey(includeIfNull: false) String? approved,
    @JsonKey(includeIfNull: false) VerificationsModel? verifications,
  }) = _ReqAttendanceModel;

  factory ReqAttendanceModel.fromJson(Map<String, Object?> json) =>
      _$ReqAttendanceModelFromJson(json);
}
