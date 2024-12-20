// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NavigationModel _$NavigationModelFromJson(Map<String, dynamic> json) {
  return _NavigationModel.fromJson(json);
}

/// @nodoc
mixin _$NavigationModel {
  StatusAbsenceSetup? get absenceType => throw _privateConstructorUsedError;
  String? get shift => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  LocationVerificationModel? get location => throw _privateConstructorUsedError;
  LatLng? get clinicPosition => throw _privateConstructorUsedError;
  double? get radius => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NavigationModelCopyWith<NavigationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationModelCopyWith<$Res> {
  factory $NavigationModelCopyWith(
          NavigationModel value, $Res Function(NavigationModel) then) =
      _$NavigationModelCopyWithImpl<$Res, NavigationModel>;
  @useResult
  $Res call(
      {StatusAbsenceSetup? absenceType,
      String? shift,
      String? reason,
      LocationVerificationModel? location,
      LatLng? clinicPosition,
      double? radius});

  $LocationVerificationModelCopyWith<$Res>? get location;
}

/// @nodoc
class _$NavigationModelCopyWithImpl<$Res, $Val extends NavigationModel>
    implements $NavigationModelCopyWith<$Res> {
  _$NavigationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? absenceType = freezed,
    Object? shift = freezed,
    Object? reason = freezed,
    Object? location = freezed,
    Object? clinicPosition = freezed,
    Object? radius = freezed,
  }) {
    return _then(_value.copyWith(
      absenceType: freezed == absenceType
          ? _value.absenceType
          : absenceType // ignore: cast_nullable_to_non_nullable
              as StatusAbsenceSetup?,
      shift: freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationVerificationModel?,
      clinicPosition: freezed == clinicPosition
          ? _value.clinicPosition
          : clinicPosition // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationVerificationModelCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationVerificationModelCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NavigationModelImplCopyWith<$Res>
    implements $NavigationModelCopyWith<$Res> {
  factory _$$NavigationModelImplCopyWith(_$NavigationModelImpl value,
          $Res Function(_$NavigationModelImpl) then) =
      __$$NavigationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StatusAbsenceSetup? absenceType,
      String? shift,
      String? reason,
      LocationVerificationModel? location,
      LatLng? clinicPosition,
      double? radius});

  @override
  $LocationVerificationModelCopyWith<$Res>? get location;
}

/// @nodoc
class __$$NavigationModelImplCopyWithImpl<$Res>
    extends _$NavigationModelCopyWithImpl<$Res, _$NavigationModelImpl>
    implements _$$NavigationModelImplCopyWith<$Res> {
  __$$NavigationModelImplCopyWithImpl(
      _$NavigationModelImpl _value, $Res Function(_$NavigationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? absenceType = freezed,
    Object? shift = freezed,
    Object? reason = freezed,
    Object? location = freezed,
    Object? clinicPosition = freezed,
    Object? radius = freezed,
  }) {
    return _then(_$NavigationModelImpl(
      absenceType: freezed == absenceType
          ? _value.absenceType
          : absenceType // ignore: cast_nullable_to_non_nullable
              as StatusAbsenceSetup?,
      shift: freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationVerificationModel?,
      clinicPosition: freezed == clinicPosition
          ? _value.clinicPosition
          : clinicPosition // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NavigationModelImpl implements _NavigationModel {
  const _$NavigationModelImpl(
      {this.absenceType,
      this.shift,
      this.reason,
      this.location,
      this.clinicPosition,
      this.radius});

  factory _$NavigationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NavigationModelImplFromJson(json);

  @override
  final StatusAbsenceSetup? absenceType;
  @override
  final String? shift;
  @override
  final String? reason;
  @override
  final LocationVerificationModel? location;
  @override
  final LatLng? clinicPosition;
  @override
  final double? radius;

  @override
  String toString() {
    return 'NavigationModel(absenceType: $absenceType, shift: $shift, reason: $reason, location: $location, clinicPosition: $clinicPosition, radius: $radius)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationModelImpl &&
            (identical(other.absenceType, absenceType) ||
                other.absenceType == absenceType) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.clinicPosition, clinicPosition) ||
                other.clinicPosition == clinicPosition) &&
            (identical(other.radius, radius) || other.radius == radius));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, absenceType, shift, reason,
      location, clinicPosition, radius);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigationModelImplCopyWith<_$NavigationModelImpl> get copyWith =>
      __$$NavigationModelImplCopyWithImpl<_$NavigationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NavigationModelImplToJson(
      this,
    );
  }
}

abstract class _NavigationModel implements NavigationModel {
  const factory _NavigationModel(
      {final StatusAbsenceSetup? absenceType,
      final String? shift,
      final String? reason,
      final LocationVerificationModel? location,
      final LatLng? clinicPosition,
      final double? radius}) = _$NavigationModelImpl;

  factory _NavigationModel.fromJson(Map<String, dynamic> json) =
      _$NavigationModelImpl.fromJson;

  @override
  StatusAbsenceSetup? get absenceType;
  @override
  String? get shift;
  @override
  String? get reason;
  @override
  LocationVerificationModel? get location;
  @override
  LatLng? get clinicPosition;
  @override
  double? get radius;
  @override
  @JsonKey(ignore: true)
  _$$NavigationModelImplCopyWith<_$NavigationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
