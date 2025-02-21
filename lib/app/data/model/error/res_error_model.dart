import 'package:freezed_annotation/freezed_annotation.dart';

part 'res_error_model.freezed.dart';
part 'res_error_model.g.dart';

@freezed
class ResErrorModel with _$ResErrorModel {
  const factory ResErrorModel({
    int? statusCode,
    String? name,
    String? message,
    bool? isShowMessageError,
    int? status,
    String? stack,
  }) = _ResErrorModel;

  factory ResErrorModel.fromJson(Map<String, Object?> json) =>
      _$ResErrorModelFromJson(json);
}
