import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/user_model.dart';

part 'data_login_model.freezed.dart';
part 'data_login_model.g.dart';

@freezed
class DataLoginModel with _$DataLoginModel {
  const factory DataLoginModel({
    String? id,
    int? ttl,
    String? created,
    String? userId,
    UserModel? user,
  }) = _DataLoginModel;

  factory DataLoginModel.fromJson(Map<String, Object?> json) =>
      _$DataLoginModelFromJson(json);
}
