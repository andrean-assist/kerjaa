import 'package:freezed_annotation/freezed_annotation.dart';

part 'req_register_face_model.freezed.dart';
part 'req_register_face_model.g.dart';

@freezed
class ReqRegisterFaceModel with _$ReqRegisterFaceModel {
  const factory ReqRegisterFaceModel({
    required String? avatar,
    required bool? isVerified,
  }) = _ReqRegisterFaceModel;

  factory ReqRegisterFaceModel.fromJson(Map<String, Object?> json) =>
      _$ReqRegisterFaceModelFromJson(json);
}
