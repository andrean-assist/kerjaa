// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrganizationModel _$OrganizationModelFromJson(Map<String, dynamic> json) {
  return _OrganizationModel.fromJson(json);
}

/// @nodoc
mixin _$OrganizationModel {
  PositionModel? get position => throw _privateConstructorUsedError;
  int? get radius => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  bool? get isShift => throw _privateConstructorUsedError;
  ShiftModel? get shift => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganizationModelCopyWith<OrganizationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationModelCopyWith<$Res> {
  factory $OrganizationModelCopyWith(
          OrganizationModel value, $Res Function(OrganizationModel) then) =
      _$OrganizationModelCopyWithImpl<$Res, OrganizationModel>;
  @useResult
  $Res call(
      {PositionModel? position,
      int? radius,
      String? id,
      bool? isShift,
      ShiftModel? shift});

  $PositionModelCopyWith<$Res>? get position;
  $ShiftModelCopyWith<$Res>? get shift;
}

/// @nodoc
class _$OrganizationModelCopyWithImpl<$Res, $Val extends OrganizationModel>
    implements $OrganizationModelCopyWith<$Res> {
  _$OrganizationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = freezed,
    Object? radius = freezed,
    Object? id = freezed,
    Object? isShift = freezed,
    Object? shift = freezed,
  }) {
    return _then(_value.copyWith(
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as PositionModel?,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isShift: freezed == isShift
          ? _value.isShift
          : isShift // ignore: cast_nullable_to_non_nullable
              as bool?,
      shift: freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PositionModelCopyWith<$Res>? get position {
    if (_value.position == null) {
      return null;
    }

    return $PositionModelCopyWith<$Res>(_value.position!, (value) {
      return _then(_value.copyWith(position: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShiftModelCopyWith<$Res>? get shift {
    if (_value.shift == null) {
      return null;
    }

    return $ShiftModelCopyWith<$Res>(_value.shift!, (value) {
      return _then(_value.copyWith(shift: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrganizationModelImplCopyWith<$Res>
    implements $OrganizationModelCopyWith<$Res> {
  factory _$$OrganizationModelImplCopyWith(_$OrganizationModelImpl value,
          $Res Function(_$OrganizationModelImpl) then) =
      __$$OrganizationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PositionModel? position,
      int? radius,
      String? id,
      bool? isShift,
      ShiftModel? shift});

  @override
  $PositionModelCopyWith<$Res>? get position;
  @override
  $ShiftModelCopyWith<$Res>? get shift;
}

/// @nodoc
class __$$OrganizationModelImplCopyWithImpl<$Res>
    extends _$OrganizationModelCopyWithImpl<$Res, _$OrganizationModelImpl>
    implements _$$OrganizationModelImplCopyWith<$Res> {
  __$$OrganizationModelImplCopyWithImpl(_$OrganizationModelImpl _value,
      $Res Function(_$OrganizationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = freezed,
    Object? radius = freezed,
    Object? id = freezed,
    Object? isShift = freezed,
    Object? shift = freezed,
  }) {
    return _then(_$OrganizationModelImpl(
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as PositionModel?,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isShift: freezed == isShift
          ? _value.isShift
          : isShift // ignore: cast_nullable_to_non_nullable
              as bool?,
      shift: freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrganizationModelImpl implements _OrganizationModel {
  const _$OrganizationModelImpl(
      {this.position, this.radius, this.id, this.isShift, this.shift});

  factory _$OrganizationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrganizationModelImplFromJson(json);

  @override
  final PositionModel? position;
  @override
  final int? radius;
  @override
  final String? id;
  @override
  final bool? isShift;
  @override
  final ShiftModel? shift;

  @override
  String toString() {
    return 'OrganizationModel(position: $position, radius: $radius, id: $id, isShift: $isShift, shift: $shift)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganizationModelImpl &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.radius, radius) || other.radius == radius) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isShift, isShift) || other.isShift == isShift) &&
            (identical(other.shift, shift) || other.shift == shift));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, position, radius, id, isShift, shift);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganizationModelImplCopyWith<_$OrganizationModelImpl> get copyWith =>
      __$$OrganizationModelImplCopyWithImpl<_$OrganizationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrganizationModelImplToJson(
      this,
    );
  }
}

abstract class _OrganizationModel implements OrganizationModel {
  const factory _OrganizationModel(
      {final PositionModel? position,
      final int? radius,
      final String? id,
      final bool? isShift,
      final ShiftModel? shift}) = _$OrganizationModelImpl;

  factory _OrganizationModel.fromJson(Map<String, dynamic> json) =
      _$OrganizationModelImpl.fromJson;

  @override
  PositionModel? get position;
  @override
  int? get radius;
  @override
  String? get id;
  @override
  bool? get isShift;
  @override
  ShiftModel? get shift;
  @override
  @JsonKey(ignore: true)
  _$$OrganizationModelImplCopyWith<_$OrganizationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
