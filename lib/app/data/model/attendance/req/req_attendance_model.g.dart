// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'req_attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReqAttendanceModelImpl _$$ReqAttendanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReqAttendanceModelImpl(
      userId: json['userId'] as String?,
      organizationId: json['organizationId'] as String?,
      date: json['date'] as String?,
      shift: json['shift'] as String?,
      type: json['type'] as String?,
      userReasonLocation: json['userReasonLocation'] as String?,
      attendanceId: json['attendanceId'] as String?,
      approved: json['approved'] as String?,
      verifications: json['verifications'] == null
          ? null
          : VerificationsModel.fromJson(
              json['verifications'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReqAttendanceModelImplToJson(
    _$ReqAttendanceModelImpl instance) {
  final val = <String, dynamic>{
    'userId': instance.userId,
    'organizationId': instance.organizationId,
    'date': instance.date,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('shift', instance.shift);
  val['type'] = instance.type;
  writeNotNull('userReasonLocation', instance.userReasonLocation);
  writeNotNull('attendanceId', instance.attendanceId);
  writeNotNull('approved', instance.approved);
  writeNotNull('verifications', instance.verifications);
  return val;
}
