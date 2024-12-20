import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? name,
    String? email,
    String? avatar,
    String? updatedAt,
    String? username,
    String? id,
    String? organizationId,
    String? position,
    bool? isVerified,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
