// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'res_attendance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResAttendanceModel _$ResAttendanceModelFromJson(Map<String, dynamic> json) {
  return _ResAttendanceModel.fromJson(json);
}

/// @nodoc
mixin _$ResAttendanceModel {
// int? status,
  String? get message => throw _privateConstructorUsedError;
  List<DataAttendanceModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResAttendanceModelCopyWith<ResAttendanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResAttendanceModelCopyWith<$Res> {
  factory $ResAttendanceModelCopyWith(
          ResAttendanceModel value, $Res Function(ResAttendanceModel) then) =
      _$ResAttendanceModelCopyWithImpl<$Res, ResAttendanceModel>;
  @useResult
  $Res call({String? message, List<DataAttendanceModel>? data});
}

/// @nodoc
class _$ResAttendanceModelCopyWithImpl<$Res, $Val extends ResAttendanceModel>
    implements $ResAttendanceModelCopyWith<$Res> {
  _$ResAttendanceModelCopyWithImpl(this._value, this._then);

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
              as List<DataAttendanceModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResAttendanceModelImplCopyWith<$Res>
    implements $ResAttendanceModelCopyWith<$Res> {
  factory _$$ResAttendanceModelImplCopyWith(_$ResAttendanceModelImpl value,
          $Res Function(_$ResAttendanceModelImpl) then) =
      __$$ResAttendanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, List<DataAttendanceModel>? data});
}

/// @nodoc
class __$$ResAttendanceModelImplCopyWithImpl<$Res>
    extends _$ResAttendanceModelCopyWithImpl<$Res, _$ResAttendanceModelImpl>
    implements _$$ResAttendanceModelImplCopyWith<$Res> {
  __$$ResAttendanceModelImplCopyWithImpl(_$ResAttendanceModelImpl _value,
      $Res Function(_$ResAttendanceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ResAttendanceModelImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataAttendanceModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResAttendanceModelImpl implements _ResAttendanceModel {
  const _$ResAttendanceModelImpl(
      {this.message, final List<DataAttendanceModel>? data})
      : _data = data;

  factory _$ResAttendanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResAttendanceModelImplFromJson(json);

// int? status,
  @override
  final String? message;
  final List<DataAttendanceModel>? _data;
  @override
  List<DataAttendanceModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResAttendanceModel(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResAttendanceModelImpl &&
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
  _$$ResAttendanceModelImplCopyWith<_$ResAttendanceModelImpl> get copyWith =>
      __$$ResAttendanceModelImplCopyWithImpl<_$ResAttendanceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResAttendanceModelImplToJson(
      this,
    );
  }
}

abstract class _ResAttendanceModel implements ResAttendanceModel {
  const factory _ResAttendanceModel(
      {final String? message,
      final List<DataAttendanceModel>? data}) = _$ResAttendanceModelImpl;

  factory _ResAttendanceModel.fromJson(Map<String, dynamic> json) =
      _$ResAttendanceModelImpl.fromJson;

  @override // int? status,
  String? get message;
  @override
  List<DataAttendanceModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$ResAttendanceModelImplCopyWith<_$ResAttendanceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
