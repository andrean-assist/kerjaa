import 'package:freezed_annotation/freezed_annotation.dart';

import 'data/data_attendance_model.dart';

part 'res_attendance_model.freezed.dart';
part 'res_attendance_model.g.dart';

@freezed
class ResAttendanceModel with _$ResAttendanceModel {
  const factory ResAttendanceModel({
    // int? status,
    String? message,
    List<DataAttendanceModel>? data,
  }) = _ResAttendanceModel;

  factory ResAttendanceModel.fromJson(Map<String, Object?> json) =>
      _$ResAttendanceModelFromJson(json);
}
