// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'req_login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReqLoginModel _$ReqLoginModelFromJson(Map<String, dynamic> json) {
  return _ReqLoginModel.fromJson(json);
}

/// @nodoc
mixin _$ReqLoginModel {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReqLoginModelCopyWith<ReqLoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReqLoginModelCopyWith<$Res> {
  factory $ReqLoginModelCopyWith(
          ReqLoginModel value, $Res Function(ReqLoginModel) then) =
      _$ReqLoginModelCopyWithImpl<$Res, ReqLoginModel>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$ReqLoginModelCopyWithImpl<$Res, $Val extends ReqLoginModel>
    implements $ReqLoginModelCopyWith<$Res> {
  _$ReqLoginModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReqLoginModelImplCopyWith<$Res>
    implements $ReqLoginModelCopyWith<$Res> {
  factory _$$ReqLoginModelImplCopyWith(
          _$ReqLoginModelImpl value, $Res Function(_$ReqLoginModelImpl) then) =
      __$$ReqLoginModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$ReqLoginModelImplCopyWithImpl<$Res>
    extends _$ReqLoginModelCopyWithImpl<$Res, _$ReqLoginModelImpl>
    implements _$$ReqLoginModelImplCopyWith<$Res> {
  __$$ReqLoginModelImplCopyWithImpl(
      _$ReqLoginModelImpl _value, $Res Function(_$ReqLoginModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$ReqLoginModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReqLoginModelImpl implements _ReqLoginModel {
  const _$ReqLoginModelImpl({required this.email, required this.password});

  factory _$ReqLoginModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReqLoginModelImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'ReqLoginModel(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReqLoginModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReqLoginModelImplCopyWith<_$ReqLoginModelImpl> get copyWith =>
      __$$ReqLoginModelImplCopyWithImpl<_$ReqLoginModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReqLoginModelImplToJson(
      this,
    );
  }
}

abstract class _ReqLoginModel implements ReqLoginModel {
  const factory _ReqLoginModel(
      {required final String email,
      required final String password}) = _$ReqLoginModelImpl;

  factory _ReqLoginModel.fromJson(Map<String, dynamic> json) =
      _$ReqLoginModelImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$ReqLoginModelImplCopyWith<_$ReqLoginModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
