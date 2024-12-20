// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventsModelImpl _$$EventsModelImplFromJson(Map<String, dynamic> json) =>
    _$EventsModelImpl(
      eventType: json['eventType'] as String?,
      eventTime: json['eventTime'] as String?,
      approved: json['approved'] as String?,
      verifiedAt: json['verifiedAt'] as String?,
      verifications: json['verifications'] == null
          ? null
          : VerificationsModel.fromJson(
              json['verifications'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EventsModelImplToJson(_$EventsModelImpl instance) =>
    <String, dynamic>{
      'eventType': instance.eventType,
      'eventTime': instance.eventTime,
      'approved': instance.approved,
      'verifiedAt': instance.verifiedAt,
    };
