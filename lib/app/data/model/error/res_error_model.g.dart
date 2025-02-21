// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResErrorModelImpl _$$ResErrorModelImplFromJson(Map<String, dynamic> json) =>
    _$ResErrorModelImpl(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      name: json['name'] as String?,
      message: json['message'] as String?,
      isShowMessageError: json['isShowMessageError'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      stack: json['stack'] as String?,
    );

Map<String, dynamic> _$$ResErrorModelImplToJson(_$ResErrorModelImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'name': instance.name,
      'message': instance.message,
      'isShowMessageError': instance.isShowMessageError,
      'status': instance.status,
      'stack': instance.stack,
    };
