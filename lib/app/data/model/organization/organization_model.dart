import 'package:assist_hadir/app/data/model/shift/shift_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../position/position_model.dart';

part 'organization_model.freezed.dart';
part 'organization_model.g.dart';

@freezed
class OrganizationModel with _$OrganizationModel {
  const factory OrganizationModel({
    PositionModel? position,
    int? radius,
    String? id,
    bool? isShift,
    ShiftModel? shift,
  }) = _OrganizationModel;

  factory OrganizationModel.fromJson(Map<String, Object?> json) =>
      _$OrganizationModelFromJson(json);
}
