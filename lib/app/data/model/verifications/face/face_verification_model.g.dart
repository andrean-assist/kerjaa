// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_verification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FaceVerificationModelImpl _$$FaceVerificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FaceVerificationModelImpl(
      userReason: json['userReason'] as String?,
      faceVerified: json['faceVerified'] as bool?,
      faceImagesUrl: json['faceImagesUrl'] as String?,
    );

Map<String, dynamic> _$$FaceVerificationModelImplToJson(
    _$FaceVerificationModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userReason', instance.userReason);
  val['faceVerified'] = instance.faceVerified;
  val['faceImagesUrl'] = instance.faceImagesUrl;
  return val;
}
