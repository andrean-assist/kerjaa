import 'package:freezed_annotation/freezed_annotation.dart';

part 'face_verification_model.freezed.dart';
part 'face_verification_model.g.dart';

@freezed
class FaceVerificationModel with _$FaceVerificationModel {
  const factory FaceVerificationModel({
    @JsonKey(includeIfNull: false) String? userReason,
    required bool? faceVerified,
    required String? faceImagesUrl,
  }) = _FaceVerificationModel;

  factory FaceVerificationModel.fromJson(Map<String, Object?> json) =>
      _$FaceVerificationModelFromJson(json);
}
