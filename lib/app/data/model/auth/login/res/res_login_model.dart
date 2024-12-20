import 'package:freezed_annotation/freezed_annotation.dart';

import 'data/data_login_model.dart';

part 'res_login_model.freezed.dart';
part 'res_login_model.g.dart';

@freezed
class ResLoginModel with _$ResLoginModel {
  const factory ResLoginModel({
    // int? status,
    String? message,
    DataLoginModel? data,
  }) = _ResLoginModel;

  factory ResLoginModel.fromJson(Map<String, Object?> json) =>
      _$ResLoginModelFromJson(json);
}
