// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataLoginModelImpl _$$DataLoginModelImplFromJson(Map<String, dynamic> json) =>
    _$DataLoginModelImpl(
      id: json['id'] as String?,
      ttl: (json['ttl'] as num?)?.toInt(),
      created: json['created'] as String?,
      userId: json['userId'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataLoginModelImplToJson(
        _$DataLoginModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ttl': instance.ttl,
      'created': instance.created,
      'userId': instance.userId,
      'user': instance.user,
    };
