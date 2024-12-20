// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataAttendanceModelImpl _$$DataAttendanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DataAttendanceModelImpl(
      userId: json['userId'] as String?,
      organizationId: json['organizationId'] as String?,
      date: json['date'] as String?,
      status: json['status'] as String?,
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => EventsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      id: json['id'] as String?,
      checkIn: json['checkIn'] as String?,
      breakStart: json['breakStart'] as String?,
      breakStop: json['breakStop'] as String?,
      checkOut: json['checkOut'] as String?,
      workHours: json['workHours'] as String?,
      breakHours: json['breakHours'] as String?,
      uniqueCode: json['uniqueCode'] as String?,
    );

Map<String, dynamic> _$$DataAttendanceModelImplToJson(
        _$DataAttendanceModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'organizationId': instance.organizationId,
      'date': instance.date,
      'status': instance.status,
      'events': instance.events,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isDeleted': instance.isDeleted,
      'id': instance.id,
      'checkIn': instance.checkIn,
      'breakStart': instance.breakStart,
      'breakStop': instance.breakStop,
      'checkOut': instance.checkOut,
      'workHours': instance.workHours,
      'breakHours': instance.breakHours,
      'uniqueCode': instance.uniqueCode,
    };
