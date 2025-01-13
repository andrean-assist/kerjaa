// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrganizationModelImpl _$$OrganizationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrganizationModelImpl(
      position: json['position'] == null
          ? null
          : PositionModel.fromJson(json['position'] as Map<String, dynamic>),
      radius: (json['radius'] as num?)?.toInt(),
      id: json['id'] as String?,
      isShift: json['isShift'] as bool?,
      shift: json['shift'] == null
          ? null
          : ShiftModel.fromJson(json['shift'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrganizationModelImplToJson(
        _$OrganizationModelImpl instance) =>
    <String, dynamic>{
      'position': instance.position,
      'radius': instance.radius,
      'id': instance.id,
      'isShift': instance.isShift,
      'shift': instance.shift,
    };
