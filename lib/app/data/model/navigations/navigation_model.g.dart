// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NavigationModelImpl _$$NavigationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NavigationModelImpl(
      absenceType:
          $enumDecodeNullable(_$StatusAbsenceSetupEnumMap, json['absenceType']),
      shift: json['shift'] as String?,
      reason: json['reason'] as String?,
      location: json['location'] == null
          ? null
          : LocationVerificationModel.fromJson(
              json['location'] as Map<String, dynamic>),
      clinicPosition: json['clinicPosition'] == null
          ? null
          : LatLng.fromJson(json['clinicPosition'] as Map<String, dynamic>),
      radius: (json['radius'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$NavigationModelImplToJson(
        _$NavigationModelImpl instance) =>
    <String, dynamic>{
      'absenceType': _$StatusAbsenceSetupEnumMap[instance.absenceType],
      'shift': instance.shift,
      'reason': instance.reason,
      'location': instance.location,
      'clinicPosition': instance.clinicPosition,
      'radius': instance.radius,
    };

const _$StatusAbsenceSetupEnumMap = {
  StatusAbsenceSetup.register: 'register',
  StatusAbsenceSetup.checkIn: 'checkIn',
  StatusAbsenceSetup.restStart: 'restStart',
  StatusAbsenceSetup.restStop: 'restStop',
  StatusAbsenceSetup.checkOut: 'checkOut',
};
