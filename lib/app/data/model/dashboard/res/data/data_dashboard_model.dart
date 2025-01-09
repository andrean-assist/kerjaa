import 'package:assist_hadir/app/data/model/position/position_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../events/events_model.dart';
import '../../../shift/shift_model.dart';

part 'data_dashboard_model.freezed.dart';
part 'data_dashboard_model.g.dart';

@freezed
class DataDashboardModel with _$DataDashboardModel {
  const factory DataDashboardModel({
    String? userId,
    String? organizationId,
    String? date,
    String? status,
    List<EventsModel>? events,
    String? createdAt,
    String? updatedAt,
    bool? isDeleted,
    String? id,
    String? checkIn,
    String? breakStart,
    String? breakStop,
    String? checkOut,
    String? workHours,
    String? breakHours,
    String? uniqueCode,
    PositionModel? position,
    num? radius,
    ShiftModel? shift,
    bool? isMobile,
  }) = _DataDashboardModel;

  factory DataDashboardModel.fromJson(Map<String, Object?> json) =>
      _$DataDashboardModelFromJson(json);
}
