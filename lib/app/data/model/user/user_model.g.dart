// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      updatedAt: json['updatedAt'] as String?,
      username: json['username'] as String?,
      id: json['id'] as String?,
      organizationId: json['organizationId'] as String?,
      position: json['position'] as String?,
      isVerified: json['isVerified'] as bool?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
      'updatedAt': instance.updatedAt,
      'username': instance.username,
      'id': instance.id,
      'organizationId': instance.organizationId,
      'position': instance.position,
      'isVerified': instance.isVerified,
    };
