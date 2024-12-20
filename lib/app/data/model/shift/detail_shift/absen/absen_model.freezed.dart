// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'absen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AbsenModel _$AbsenModelFromJson(Map<String, dynamic> json) {
  return _AbsenModel.fromJson(json);
}

/// @nodoc
mixin _$AbsenModel {
  String? get start => throw _privateConstructorUsedError;
  String? get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AbsenModelCopyWith<AbsenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsenModelCopyWith<$Res> {
  factory $AbsenModelCopyWith(
          AbsenModel value, $Res Function(AbsenModel) then) =
      _$AbsenModelCopyWithImpl<$Res, AbsenModel>;
  @useResult
  $Res call({String? start, String? end});
}

/// @nodoc
class _$AbsenModelCopyWithImpl<$Res, $Val extends AbsenModel>
    implements $AbsenModelCopyWith<$Res> {
  _$AbsenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_value.copyWith(
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AbsenModelImplCopyWith<$Res>
    implements $AbsenModelCopyWith<$Res> {
  factory _$$AbsenModelImplCopyWith(
          _$AbsenModelImpl value, $Res Function(_$AbsenModelImpl) then) =
      __$$AbsenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? start, String? end});
}

/// @nodoc
class __$$AbsenModelImplCopyWithImpl<$Res>
    extends _$AbsenModelCopyWithImpl<$Res, _$AbsenModelImpl>
    implements _$$AbsenModelImplCopyWith<$Res> {
  __$$AbsenModelImplCopyWithImpl(
      _$AbsenModelImpl _value, $Res Function(_$AbsenModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_$AbsenModelImpl(
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbsenModelImpl implements _AbsenModel {
  const _$AbsenModelImpl({this.start, this.end});

  factory _$AbsenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AbsenModelImplFromJson(json);

  @override
  final String? start;
  @override
  final String? end;

  @override
  String toString() {
    return 'AbsenModel(start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsenModelImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsenModelImplCopyWith<_$AbsenModelImpl> get copyWith =>
      __$$AbsenModelImplCopyWithImpl<_$AbsenModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AbsenModelImplToJson(
      this,
    );
  }
}

abstract class _AbsenModel implements AbsenModel {
  const factory _AbsenModel({final String? start, final String? end}) =
      _$AbsenModelImpl;

  factory _AbsenModel.fromJson(Map<String, dynamic> json) =
      _$AbsenModelImpl.fromJson;

  @override
  String? get start;
  @override
  String? get end;
  @override
  @JsonKey(ignore: true)
  _$$AbsenModelImplCopyWith<_$AbsenModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
