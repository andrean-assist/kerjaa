// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataDashboardModelImpl _$$DataDashboardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DataDashboardModelImpl(
      attendance: json['attendance'] == null
          ? null
          : DataAttendanceModel.fromJson(
              json['attendance'] as Map<String, dynamic>),
      organization: json['organization'] == null
          ? null
          : OrganizationModel.fromJson(
              json['organization'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataDashboardModelImplToJson(
        _$DataDashboardModelImpl instance) =>
    <String, dynamic>{
      'attendance': instance.attendance,
      'organization': instance.organization,
    };
