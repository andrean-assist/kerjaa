import 'package:freezed_annotation/freezed_annotation.dart';

import 'absen/absen_model.dart';

part 'detail_shift_model.freezed.dart';
part 'detail_shift_model.g.dart';

@freezed
class DetailShiftModel with _$DetailShiftModel {
  const factory DetailShiftModel({
    AbsenModel? absen,
    AbsenModel? istirahat,
  }) = _DetailShiftModel;

  factory DetailShiftModel.fromJson(Map<String, Object?> json) =>
      _$DetailShiftModelFromJson(json);
}
