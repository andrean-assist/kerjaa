// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResDashboardModelImpl _$$ResDashboardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResDashboardModelImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DataDashboardModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResDashboardModelImplToJson(
        _$ResDashboardModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
