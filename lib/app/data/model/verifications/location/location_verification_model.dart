import 'package:freezed_annotation/freezed_annotation.dart';

import '../../position/position_model.dart';

part 'location_verification_model.freezed.dart';
part 'location_verification_model.g.dart';

@freezed
class LocationVerificationModel with _$LocationVerificationModel {
  const factory LocationVerificationModel({
    required bool? locationVerified,
    @JsonSerializable(explicitToJson: true) required PositionModel? position,
  }) = _LocationVerificationModel;

  factory LocationVerificationModel.fromJson(Map<String, Object?> json) =>
      _$LocationVerificationModelFromJson(json);
}
