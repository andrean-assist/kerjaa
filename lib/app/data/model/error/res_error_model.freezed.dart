// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'res_error_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResErrorModel _$ResErrorModelFromJson(Map<String, dynamic> json) {
  return _ResErrorModel.fromJson(json);
}

/// @nodoc
mixin _$ResErrorModel {
  int? get statusCode => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool? get isShowMessageError => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String? get stack => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResErrorModelCopyWith<ResErrorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResErrorModelCopyWith<$Res> {
  factory $ResErrorModelCopyWith(
          ResErrorModel value, $Res Function(ResErrorModel) then) =
      _$ResErrorModelCopyWithImpl<$Res, ResErrorModel>;
  @useResult
  $Res call(
      {int? statusCode,
      String? name,
      String? message,
      bool? isShowMessageError,
      int? status,
      String? stack});
}

/// @nodoc
class _$ResErrorModelCopyWithImpl<$Res, $Val extends ResErrorModel>
    implements $ResErrorModelCopyWith<$Res> {
  _$ResErrorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? name = freezed,
    Object? message = freezed,
    Object? isShowMessageError = freezed,
    Object? status = freezed,
    Object? stack = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      isShowMessageError: freezed == isShowMessageError
          ? _value.isShowMessageError
          : isShowMessageError // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      stack: freezed == stack
          ? _value.stack
          : stack // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResErrorModelImplCopyWith<$Res>
    implements $ResErrorModelCopyWith<$Res> {
  factory _$$ResErrorModelImplCopyWith(
          _$ResErrorModelImpl value, $Res Function(_$ResErrorModelImpl) then) =
      __$$ResErrorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? statusCode,
      String? name,
      String? message,
      bool? isShowMessageError,
      int? status,
      String? stack});
}

/// @nodoc
class __$$ResErrorModelImplCopyWithImpl<$Res>
    extends _$ResErrorModelCopyWithImpl<$Res, _$ResErrorModelImpl>
    implements _$$ResErrorModelImplCopyWith<$Res> {
  __$$ResErrorModelImplCopyWithImpl(
      _$ResErrorModelImpl _value, $Res Function(_$ResErrorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? name = freezed,
    Object? message = freezed,
    Object? isShowMessageError = freezed,
    Object? status = freezed,
    Object? stack = freezed,
  }) {
    return _then(_$ResErrorModelImpl(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      isShowMessageError: freezed == isShowMessageError
          ? _value.isShowMessageError
          : isShowMessageError // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      stack: freezed == stack
          ? _value.stack
          : stack // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResErrorModelImpl implements _ResErrorModel {
  const _$ResErrorModelImpl(
      {this.statusCode,
      this.name,
      this.message,
      this.isShowMessageError,
      this.status,
      this.stack});

  factory _$ResErrorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResErrorModelImplFromJson(json);

  @override
  final int? statusCode;
  @override
  final String? name;
  @override
  final String? message;
  @override
  final bool? isShowMessageError;
  @override
  final int? status;
  @override
  final String? stack;

  @override
  String toString() {
    return 'ResErrorModel(statusCode: $statusCode, name: $name, message: $message, isShowMessageError: $isShowMessageError, status: $status, stack: $stack)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResErrorModelImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isShowMessageError, isShowMessageError) ||
                other.isShowMessageError == isShowMessageError) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.stack, stack) || other.stack == stack));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, name, message,
      isShowMessageError, status, stack);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResErrorModelImplCopyWith<_$ResErrorModelImpl> get copyWith =>
      __$$ResErrorModelImplCopyWithImpl<_$ResErrorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResErrorModelImplToJson(
      this,
    );
  }
}

abstract class _ResErrorModel implements ResErrorModel {
  const factory _ResErrorModel(
      {final int? statusCode,
      final String? name,
      final String? message,
      final bool? isShowMessageError,
      final int? status,
      final String? stack}) = _$ResErrorModelImpl;

  factory _ResErrorModel.fromJson(Map<String, dynamic> json) =
      _$ResErrorModelImpl.fromJson;

  @override
  int? get statusCode;
  @override
  String? get name;
  @override
  String? get message;
  @override
  bool? get isShowMessageError;
  @override
  int? get status;
  @override
  String? get stack;
  @override
  @JsonKey(ignore: true)
  _$$ResErrorModelImplCopyWith<_$ResErrorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
