// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_verification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocationVerificationModel _$LocationVerificationModelFromJson(
    Map<String, dynamic> json) {
  return _LocationVerificationModel.fromJson(json);
}

/// @nodoc
mixin _$LocationVerificationModel {
  bool? get locationVerified => throw _privateConstructorUsedError;
  @JsonSerializable(explicitToJson: true)
  PositionModel? get position => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationVerificationModelCopyWith<LocationVerificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationVerificationModelCopyWith<$Res> {
  factory $LocationVerificationModelCopyWith(LocationVerificationModel value,
          $Res Function(LocationVerificationModel) then) =
      _$LocationVerificationModelCopyWithImpl<$Res, LocationVerificationModel>;
  @useResult
  $Res call(
      {bool? locationVerified,
      @JsonSerializable(explicitToJson: true) PositionModel? position});

  $PositionModelCopyWith<$Res>? get position;
}

/// @nodoc
class _$LocationVerificationModelCopyWithImpl<$Res,
        $Val extends LocationVerificationModel>
    implements $LocationVerificationModelCopyWith<$Res> {
  _$LocationVerificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationVerified = freezed,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      locationVerified: freezed == locationVerified
          ? _value.locationVerified
          : locationVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as PositionModel?,
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
}

/// @nodoc
abstract class _$$LocationVerificationModelImplCopyWith<$Res>
    implements $LocationVerificationModelCopyWith<$Res> {
  factory _$$LocationVerificationModelImplCopyWith(
          _$LocationVerificationModelImpl value,
          $Res Function(_$LocationVerificationModelImpl) then) =
      __$$LocationVerificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? locationVerified,
      @JsonSerializable(explicitToJson: true) PositionModel? position});

  @override
  $PositionModelCopyWith<$Res>? get position;
}

/// @nodoc
class __$$LocationVerificationModelImplCopyWithImpl<$Res>
    extends _$LocationVerificationModelCopyWithImpl<$Res,
        _$LocationVerificationModelImpl>
    implements _$$LocationVerificationModelImplCopyWith<$Res> {
  __$$LocationVerificationModelImplCopyWithImpl(
      _$LocationVerificationModelImpl _value,
      $Res Function(_$LocationVerificationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationVerified = freezed,
    Object? position = freezed,
  }) {
    return _then(_$LocationVerificationModelImpl(
      locationVerified: freezed == locationVerified
          ? _value.locationVerified
          : locationVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as PositionModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationVerificationModelImpl implements _LocationVerificationModel {
  const _$LocationVerificationModelImpl(
      {required this.locationVerified,
      @JsonSerializable(explicitToJson: true) required this.position});

  factory _$LocationVerificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationVerificationModelImplFromJson(json);

  @override
  final bool? locationVerified;
  @override
  @JsonSerializable(explicitToJson: true)
  final PositionModel? position;

  @override
  String toString() {
    return 'LocationVerificationModel(locationVerified: $locationVerified, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationVerificationModelImpl &&
            (identical(other.locationVerified, locationVerified) ||
                other.locationVerified == locationVerified) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, locationVerified, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationVerificationModelImplCopyWith<_$LocationVerificationModelImpl>
      get copyWith => __$$LocationVerificationModelImplCopyWithImpl<
          _$LocationVerificationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationVerificationModelImplToJson(
      this,
    );
  }
}

abstract class _LocationVerificationModel implements LocationVerificationModel {
  const factory _LocationVerificationModel(
          {required final bool? locationVerified,
          @JsonSerializable(explicitToJson: true)
          required final PositionModel? position}) =
      _$LocationVerificationModelImpl;

  factory _LocationVerificationModel.fromJson(Map<String, dynamic> json) =
      _$LocationVerificationModelImpl.fromJson;

  @override
  bool? get locationVerified;
  @override
  @JsonSerializable(explicitToJson: true)
  PositionModel? get position;
  @override
  @JsonKey(ignore: true)
  _$$LocationVerificationModelImplCopyWith<_$LocationVerificationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
