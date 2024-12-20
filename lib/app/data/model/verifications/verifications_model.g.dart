// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verifications_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerificationsModelImpl _$$VerificationsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerificationsModelImpl(
      faceVerification: json['faceVerification'] == null
          ? null
          : FaceVerificationModel.fromJson(
              json['faceVerification'] as Map<String, dynamic>),
      locationVerification: json['locationVerification'] == null
          ? null
          : LocationVerificationModel.fromJson(
              json['locationVerification'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VerificationsModelImplToJson(
        _$VerificationsModelImpl instance) =>
    <String, dynamic>{
      'faceVerification': instance.faceVerification,
      'locationVerification': instance.locationVerification,
    };
