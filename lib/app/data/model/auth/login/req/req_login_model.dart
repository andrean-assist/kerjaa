import 'package:freezed_annotation/freezed_annotation.dart';

part 'req_login_model.freezed.dart';
part 'req_login_model.g.dart';

@freezed
class ReqLoginModel with _$ReqLoginModel {
  const factory ReqLoginModel({
    required String email,
    required String password,
  }) = _ReqLoginModel;

  factory ReqLoginModel.fromJson(Map<String, Object?> json) =>
      _$ReqLoginModelFromJson(json);
}
