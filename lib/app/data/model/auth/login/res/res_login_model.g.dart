// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResLoginModelImpl _$$ResLoginModelImplFromJson(Map<String, dynamic> json) =>
    _$ResLoginModelImpl(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DataLoginModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResLoginModelImplToJson(_$ResLoginModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
