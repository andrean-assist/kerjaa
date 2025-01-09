// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrganizationModelImpl _$$OrganizationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrganizationModelImpl(
      organizationId: json['organizationId'] as String?,
      position: json['position'] == null
          ? null
          : PositionModel.fromJson(json['position'] as Map<String, dynamic>),
      radius: (json['radius'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OrganizationModelImplToJson(
        _$OrganizationModelImpl instance) =>
    <String, dynamic>{
      'organizationId': instance.organizationId,
      'position': instance.position,
      'radius': instance.radius,
    };
