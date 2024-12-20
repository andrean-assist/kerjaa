import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:assist_hadir/shared/shared_enum.dart';
import 'package:latlong2/latlong.dart';

import '../verifications/location/location_verification_model.dart';

part 'navigation_model.freezed.dart';
part 'navigation_model.g.dart';

@freezed
class NavigationModel with _$NavigationModel {
  const factory NavigationModel({
    StatusAbsenceSetup? absenceType,
    String? shift,
    String? reason,
    LocationVerificationModel? location,
    LatLng? clinicPosition,
    double? radius,
  }) = _NavigationModel;

  factory NavigationModel.fromJson(Map<String, Object?> json) =>
      _$NavigationModelFromJson(json);
}