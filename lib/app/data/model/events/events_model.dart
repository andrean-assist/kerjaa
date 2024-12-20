import 'package:freezed_annotation/freezed_annotation.dart';

import '../verifications/verifications_model.dart';

part 'events_model.freezed.dart';
part 'events_model.g.dart';

@freezed
class EventsModel with _$EventsModel {
  const factory EventsModel({
    String? eventType,
    String? eventTime,
    String? approved,
    String? verifiedAt,
    @JsonKey(includeToJson: false) VerificationsModel? verifications,
  }) = _EventsModel;

  factory EventsModel.fromJson(Map<String, dynamic> json) =>
      _$EventsModelFromJson(json);
}
