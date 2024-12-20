// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataDashboardModelImpl _$$DataDashboardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DataDashboardModelImpl(
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
      position: json['position'] == null
          ? null
          : PositionModel.fromJson(json['position'] as Map<String, dynamic>),
      radius: json['radius'] as num?,
      shift: json['shift'] == null
          ? null
          : ShiftModel.fromJson(json['shift'] as Map<String, dynamic>),
      isMobile: json['isMobile'] as bool?,
    );

Map<String, dynamic> _$$DataDashboardModelImplToJson(
        _$DataDashboardModelImpl instance) =>
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
      'position': instance.position,
      'radius': instance.radius,
      'shift': instance.shift,
      'isMobile': instance.isMobile,
    };
