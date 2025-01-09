// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'res_new_dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResNewDashboardModel _$ResNewDashboardModelFromJson(Map<String, dynamic> json) {
  return _ResNewDashboardModel.fromJson(json);
}

/// @nodoc
mixin _$ResNewDashboardModel {
// String? status,
  String? get message => throw _privateConstructorUsedError;
  List<DataNewDashboardModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResNewDashboardModelCopyWith<ResNewDashboardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResNewDashboardModelCopyWith<$Res> {
  factory $ResNewDashboardModelCopyWith(ResNewDashboardModel value,
          $Res Function(ResNewDashboardModel) then) =
      _$ResNewDashboardModelCopyWithImpl<$Res, ResNewDashboardModel>;
  @useResult
  $Res call({String? message, List<DataNewDashboardModel>? data});
}

/// @nodoc
class _$ResNewDashboardModelCopyWithImpl<$Res,
        $Val extends ResNewDashboardModel>
    implements $ResNewDashboardModelCopyWith<$Res> {
  _$ResNewDashboardModelCopyWithImpl(this._value, this._then);

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
              as List<DataNewDashboardModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResNewDashboardModelImplCopyWith<$Res>
    implements $ResNewDashboardModelCopyWith<$Res> {
  factory _$$ResNewDashboardModelImplCopyWith(_$ResNewDashboardModelImpl value,
          $Res Function(_$ResNewDashboardModelImpl) then) =
      __$$ResNewDashboardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, List<DataNewDashboardModel>? data});
}

/// @nodoc
class __$$ResNewDashboardModelImplCopyWithImpl<$Res>
    extends _$ResNewDashboardModelCopyWithImpl<$Res, _$ResNewDashboardModelImpl>
    implements _$$ResNewDashboardModelImplCopyWith<$Res> {
  __$$ResNewDashboardModelImplCopyWithImpl(_$ResNewDashboardModelImpl _value,
      $Res Function(_$ResNewDashboardModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ResNewDashboardModelImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataNewDashboardModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResNewDashboardModelImpl implements _ResNewDashboardModel {
  const _$ResNewDashboardModelImpl(
      {this.message, final List<DataNewDashboardModel>? data})
      : _data = data;

  factory _$ResNewDashboardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResNewDashboardModelImplFromJson(json);

// String? status,
  @override
  final String? message;
  final List<DataNewDashboardModel>? _data;
  @override
  List<DataNewDashboardModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResNewDashboardModel(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResNewDashboardModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResNewDashboardModelImplCopyWith<_$ResNewDashboardModelImpl>
      get copyWith =>
          __$$ResNewDashboardModelImplCopyWithImpl<_$ResNewDashboardModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResNewDashboardModelImplToJson(
      this,
    );
  }
}

abstract class _ResNewDashboardModel implements ResNewDashboardModel {
  const factory _ResNewDashboardModel(
      {final String? message,
      final List<DataNewDashboardModel>? data}) = _$ResNewDashboardModelImpl;

  factory _ResNewDashboardModel.fromJson(Map<String, dynamic> json) =
      _$ResNewDashboardModelImpl.fromJson;

  @override // String? status,
  String? get message;
  @override
  List<DataNewDashboardModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$ResNewDashboardModelImplCopyWith<_$ResNewDashboardModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
