import 'package:freezed_annotation/freezed_annotation.dart';

import 'face/face_verification_model.dart';
import 'location/location_verification_model.dart';

part 'verifications_model.freezed.dart';
part 'verifications_model.g.dart';

@freezed
class VerificationsModel with _$VerificationsModel {
  const factory VerificationsModel({
    @JsonSerializable(explicitToJson: true)
    required FaceVerificationModel? faceVerification,
    @JsonSerializable(explicitToJson: true)
    required LocationVerificationModel? locationVerification,
  }) = _VerificationsModel;

  factory VerificationsModel.fromJson(Map<String, Object?> json) =>
      _$VerificationsModelFromJson(json);
}
