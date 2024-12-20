// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_verification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationVerificationModelImpl _$$LocationVerificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LocationVerificationModelImpl(
      locationVerified: json['locationVerified'] as bool?,
      position: json['position'] == null
          ? null
          : PositionModel.fromJson(json['position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LocationVerificationModelImplToJson(
        _$LocationVerificationModelImpl instance) =>
    <String, dynamic>{
      'locationVerified': instance.locationVerified,
      'position': instance.position,
    };
