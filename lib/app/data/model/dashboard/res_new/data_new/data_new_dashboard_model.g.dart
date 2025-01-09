// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_new_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataNewDashboardModelImpl _$$DataNewDashboardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DataNewDashboardModelImpl(
      organization: json['organization'] == null
          ? null
          : OrganizationModel.fromJson(
              json['organization'] as Map<String, dynamic>),
      attendance: json['attendance'] == null
          ? null
          : DataAttendanceModel.fromJson(
              json['attendance'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataNewDashboardModelImplToJson(
        _$DataNewDashboardModelImpl instance) =>
    <String, dynamic>{
      'organization': instance.organization,
      'attendance': instance.attendance,
    };
