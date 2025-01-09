import 'package:freezed_annotation/freezed_annotation.dart';

import 'data_new/data_new_dashboard_model.dart';

part 'res_new_dashboard_model.freezed.dart';
part 'res_new_dashboard_model.g.dart';

@freezed
class ResNewDashboardModel with _$ResNewDashboardModel {
  const factory ResNewDashboardModel({
    // String? status,
    String? message,
    List<DataNewDashboardModel>? data,
  }) = _ResNewDashboardModel;

  factory ResNewDashboardModel.fromJson(Map<String, Object?> json) =>
      _$ResNewDashboardModelFromJson(json);
}
