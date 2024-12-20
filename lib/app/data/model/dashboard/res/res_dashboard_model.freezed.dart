// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'res_dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResDashboardModel _$ResDashboardModelFromJson(Map<String, dynamic> json) {
  return _ResDashboardModel.fromJson(json);
}

/// @nodoc
mixin _$ResDashboardModel {
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  DataDashboardModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResDashboardModelCopyWith<ResDashboardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResDashboardModelCopyWith<$Res> {
  factory $ResDashboardModelCopyWith(
          ResDashboardModel value, $Res Function(ResDashboardModel) then) =
      _$ResDashboardModelCopyWithImpl<$Res, ResDashboardModel>;
  @useResult
  $Res call({String? status, String? message, DataDashboardModel? data});

  $DataDashboardModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$ResDashboardModelCopyWithImpl<$Res, $Val extends ResDashboardModel>
    implements $ResDashboardModelCopyWith<$Res> {
  _$ResDashboardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataDashboardModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataDashboardModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataDashboardModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResDashboardModelImplCopyWith<$Res>
    implements $ResDashboardModelCopyWith<$Res> {
  factory _$$ResDashboardModelImplCopyWith(_$ResDashboardModelImpl value,
          $Res Function(_$ResDashboardModelImpl) then) =
      __$$ResDashboardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? message, DataDashboardModel? data});

  @override
  $DataDashboardModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ResDashboardModelImplCopyWithImpl<$Res>
    extends _$ResDashboardModelCopyWithImpl<$Res, _$ResDashboardModelImpl>
    implements _$$ResDashboardModelImplCopyWith<$Res> {
  __$$ResDashboardModelImplCopyWithImpl(_$ResDashboardModelImpl _value,
      $Res Function(_$ResDashboardModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ResDashboardModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataDashboardModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResDashboardModelImpl implements _ResDashboardModel {
  const _$ResDashboardModelImpl({this.status, this.message, this.data});

  factory _$ResDashboardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResDashboardModelImplFromJson(json);

  @override
  final String? status;
  @override
  final String? message;
  @override
  final DataDashboardModel? data;

  @override
  String toString() {
    return 'ResDashboardModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResDashboardModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResDashboardModelImplCopyWith<_$ResDashboardModelImpl> get copyWith =>
      __$$ResDashboardModelImplCopyWithImpl<_$ResDashboardModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResDashboardModelImplToJson(
      this,
    );
  }
}

abstract class _ResDashboardModel implements ResDashboardModel {
  const factory _ResDashboardModel(
      {final String? status,
      final String? message,
      final DataDashboardModel? data}) = _$ResDashboardModelImpl;

  factory _ResDashboardModel.fromJson(Map<String, dynamic> json) =
      _$ResDashboardModelImpl.fromJson;

  @override
  String? get status;
  @override
  String? get message;
  @override
  DataDashboardModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$ResDashboardModelImplCopyWith<_$ResDashboardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
