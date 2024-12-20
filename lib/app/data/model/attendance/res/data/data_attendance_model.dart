import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../events/events_model.dart';

part 'data_attendance_model.freezed.dart';
part 'data_attendance_model.g.dart';

@freezed
class DataAttendanceModel with _$DataAttendanceModel {
  const factory DataAttendanceModel({
    String? userId,
    String? organizationId,
    String? date,
    String? status,
    List<EventsModel>? events,
    String? createdAt,
    String? updatedAt,
    bool? isDeleted,
    String? id,
    String? checkIn,
    String? breakStart,
    String? breakStop,
    String? checkOut,
    String? workHours,
    String? breakHours,
    String? uniqueCode,
  }) = _DataAttendanceModel;

  factory DataAttendanceModel.fromJson(Map<String, Object?> json) =>
      _$DataAttendanceModelFromJson(json);
}
