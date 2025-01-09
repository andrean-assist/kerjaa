// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_new_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResNewDashboardModelImpl _$$ResNewDashboardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResNewDashboardModelImpl(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => DataNewDashboardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ResNewDashboardModelImplToJson(
        _$ResNewDashboardModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
