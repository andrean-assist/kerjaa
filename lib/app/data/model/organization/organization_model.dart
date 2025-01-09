import 'package:freezed_annotation/freezed_annotation.dart';

import '../position/position_model.dart';

part 'organization_model.freezed.dart';
part 'organization_model.g.dart';

@freezed
class OrganizationModel with _$OrganizationModel {
  const factory OrganizationModel({
    String? organizationId,
    PositionModel? position,
    int? radius,
  }) = _OrganizationModel;

  factory OrganizationModel.fromJson(Map<String, Object?> json) =>
      _$OrganizationModelFromJson(json);
}
