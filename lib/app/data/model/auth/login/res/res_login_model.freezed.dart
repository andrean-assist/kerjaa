// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'res_login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResLoginModel _$ResLoginModelFromJson(Map<String, dynamic> json) {
  return _ResLoginModel.fromJson(json);
}

/// @nodoc
mixin _$ResLoginModel {
// int? status,
  String? get message => throw _privateConstructorUsedError;
  DataLoginModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResLoginModelCopyWith<ResLoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResLoginModelCopyWith<$Res> {
  factory $ResLoginModelCopyWith(
          ResLoginModel value, $Res Function(ResLoginModel) then) =
      _$ResLoginModelCopyWithImpl<$Res, ResLoginModel>;
  @useResult
  $Res call({String? message, DataLoginModel? data});

  $DataLoginModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$ResLoginModelCopyWithImpl<$Res, $Val extends ResLoginModel>
    implements $ResLoginModelCopyWith<$Res> {
  _$ResLoginModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataLoginModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataLoginModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataLoginModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResLoginModelImplCopyWith<$Res>
    implements $ResLoginModelCopyWith<$Res> {
  factory _$$ResLoginModelImplCopyWith(
          _$ResLoginModelImpl value, $Res Function(_$ResLoginModelImpl) then) =
      __$$ResLoginModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, DataLoginModel? data});

  @override
  $DataLoginModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ResLoginModelImplCopyWithImpl<$Res>
    extends _$ResLoginModelCopyWithImpl<$Res, _$ResLoginModelImpl>
    implements _$$ResLoginModelImplCopyWith<$Res> {
  __$$ResLoginModelImplCopyWithImpl(
      _$ResLoginModelImpl _value, $Res Function(_$ResLoginModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ResLoginModelImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataLoginModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResLoginModelImpl implements _ResLoginModel {
  const _$ResLoginModelImpl({this.message, this.data});

  factory _$ResLoginModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResLoginModelImplFromJson(json);

// int? status,
  @override
  final String? message;
  @override
  final DataLoginModel? data;

  @override
  String toString() {
    return 'ResLoginModel(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResLoginModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResLoginModelImplCopyWith<_$ResLoginModelImpl> get copyWith =>
      __$$ResLoginModelImplCopyWithImpl<_$ResLoginModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResLoginModelImplToJson(
      this,
    );
  }
}

abstract class _ResLoginModel implements ResLoginModel {
  const factory _ResLoginModel(
      {final String? message,
      final DataLoginModel? data}) = _$ResLoginModelImpl;

  factory _ResLoginModel.fromJson(Map<String, dynamic> json) =
      _$ResLoginModelImpl.fromJson;

  @override // int? status,
  String? get message;
  @override
  DataLoginModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$ResLoginModelImplCopyWith<_$ResLoginModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
