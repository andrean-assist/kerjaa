// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DataLoginModel _$DataLoginModelFromJson(Map<String, dynamic> json) {
  return _DataLoginModel.fromJson(json);
}

/// @nodoc
mixin _$DataLoginModel {
  String? get id => throw _privateConstructorUsedError;
  int? get ttl => throw _privateConstructorUsedError;
  String? get created => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataLoginModelCopyWith<DataLoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataLoginModelCopyWith<$Res> {
  factory $DataLoginModelCopyWith(
          DataLoginModel value, $Res Function(DataLoginModel) then) =
      _$DataLoginModelCopyWithImpl<$Res, DataLoginModel>;
  @useResult
  $Res call(
      {String? id, int? ttl, String? created, String? userId, UserModel? user});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$DataLoginModelCopyWithImpl<$Res, $Val extends DataLoginModel>
    implements $DataLoginModelCopyWith<$Res> {
  _$DataLoginModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ttl = freezed,
    Object? created = freezed,
    Object? userId = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      ttl: freezed == ttl
          ? _value.ttl
          : ttl // ignore: cast_nullable_to_non_nullable
              as int?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataLoginModelImplCopyWith<$Res>
    implements $DataLoginModelCopyWith<$Res> {
  factory _$$DataLoginModelImplCopyWith(_$DataLoginModelImpl value,
          $Res Function(_$DataLoginModelImpl) then) =
      __$$DataLoginModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id, int? ttl, String? created, String? userId, UserModel? user});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$DataLoginModelImplCopyWithImpl<$Res>
    extends _$DataLoginModelCopyWithImpl<$Res, _$DataLoginModelImpl>
    implements _$$DataLoginModelImplCopyWith<$Res> {
  __$$DataLoginModelImplCopyWithImpl(
      _$DataLoginModelImpl _value, $Res Function(_$DataLoginModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ttl = freezed,
    Object? created = freezed,
    Object? userId = freezed,
    Object? user = freezed,
  }) {
    return _then(_$DataLoginModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      ttl: freezed == ttl
          ? _value.ttl
          : ttl // ignore: cast_nullable_to_non_nullable
              as int?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataLoginModelImpl implements _DataLoginModel {
  const _$DataLoginModelImpl(
      {this.id, this.ttl, this.created, this.userId, this.user});

  factory _$DataLoginModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataLoginModelImplFromJson(json);

  @override
  final String? id;
  @override
  final int? ttl;
  @override
  final String? created;
  @override
  final String? userId;
  @override
  final UserModel? user;

  @override
  String toString() {
    return 'DataLoginModel(id: $id, ttl: $ttl, created: $created, userId: $userId, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataLoginModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ttl, ttl) || other.ttl == ttl) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, ttl, created, userId, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataLoginModelImplCopyWith<_$DataLoginModelImpl> get copyWith =>
      __$$DataLoginModelImplCopyWithImpl<_$DataLoginModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataLoginModelImplToJson(
      this,
    );
  }
}

abstract class _DataLoginModel implements DataLoginModel {
  const factory _DataLoginModel(
      {final String? id,
      final int? ttl,
      final String? created,
      final String? userId,
      final UserModel? user}) = _$DataLoginModelImpl;

  factory _DataLoginModel.fromJson(Map<String, dynamic> json) =
      _$DataLoginModelImpl.fromJson;

  @override
  String? get id;
  @override
  int? get ttl;
  @override
  String? get created;
  @override
  String? get userId;
  @override
  UserModel? get user;
  @override
  @JsonKey(ignore: true)
  _$$DataLoginModelImplCopyWith<_$DataLoginModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
