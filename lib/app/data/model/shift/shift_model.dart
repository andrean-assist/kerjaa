import 'package:freezed_annotation/freezed_annotation.dart';

import 'detail_shift/detail_shift_model.dart';

part 'shift_model.freezed.dart';
part 'shift_model.g.dart';

@freezed
class ShiftModel with _$ShiftModel {
  const factory ShiftModel({
    DetailShiftModel? pagi,
    DetailShiftModel? siang,
    DetailShiftModel? malam,
  }) = _ShiftModel;

  factory ShiftModel.fromJson(Map<String, Object?> json) =>
      _$ShiftModelFromJson(json);
}
