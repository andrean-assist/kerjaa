// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResAttendanceModelImpl _$$ResAttendanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResAttendanceModelImpl(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataAttendanceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ResAttendanceModelImplToJson(
        _$ResAttendanceModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
