import 'package:freezed_annotation/freezed_annotation.dart';

part 'absen_model.freezed.dart';
part 'absen_model.g.dart';

@freezed
class AbsenModel with _$AbsenModel {
  const factory AbsenModel({
    String? start,
    String? end,
  }) = _AbsenModel;

  factory AbsenModel.fromJson(Map<String, Object?> json) =>
      _$AbsenModelFromJson(json);
}
