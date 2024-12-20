import 'package:freezed_annotation/freezed_annotation.dart';

import 'data/data_dashboard_model.dart';

part 'res_dashboard_model.freezed.dart';
part 'res_dashboard_model.g.dart';

@freezed
class ResDashboardModel with _$ResDashboardModel {
  const factory ResDashboardModel({
    String? status,
    String? message,
    DataDashboardModel? data,
  }) = _ResDashboardModel;

  factory ResDashboardModel.fromJson(Map<String, Object?> json) =>
      _$ResDashboardModelFromJson(json);
}
