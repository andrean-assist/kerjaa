// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verifications_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerificationsModel _$VerificationsModelFromJson(Map<String, dynamic> json) {
  return _VerificationsModel.fromJson(json);
}

/// @nodoc
mixin _$VerificationsModel {
  @JsonSerializable(explicitToJson: true)
  FaceVerificationModel? get faceVerification =>
      throw _privateConstructorUsedError;
  @JsonSerializable(explicitToJson: true)
  LocationVerificationModel? get locationVerification =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerificationsModelCopyWith<VerificationsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationsModelCopyWith<$Res> {
  factory $VerificationsModelCopyWith(
          VerificationsModel value, $Res Function(VerificationsModel) then) =
      _$VerificationsModelCopyWithImpl<$Res, VerificationsModel>;
  @useResult
  $Res call(
      {@JsonSerializable(explicitToJson: true)
      FaceVerificationModel? faceVerification,
      @JsonSerializable(explicitToJson: true)
      LocationVerificationModel? locationVerification});

  $FaceVerificationModelCopyWith<$Res>? get faceVerification;
  $LocationVerificationModelCopyWith<$Res>? get locationVerification;
}

/// @nodoc
class _$VerificationsModelCopyWithImpl<$Res, $Val extends VerificationsModel>
    implements $VerificationsModelCopyWith<$Res> {
  _$VerificationsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faceVerification = freezed,
    Object? locationVerification = freezed,
  }) {
    return _then(_value.copyWith(
      faceVerification: freezed == faceVerification
          ? _value.faceVerification
          : faceVerification // ignore: cast_nullable_to_non_nullable
              as FaceVerificationModel?,
      locationVerification: freezed == locationVerification
          ? _value.locationVerification
          : locationVerification // ignore: cast_nullable_to_non_nullable
              as LocationVerificationModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FaceVerificationModelCopyWith<$Res>? get faceVerification {
    if (_value.faceVerification == null) {
      return null;
    }

    return $FaceVerificationModelCopyWith<$Res>(_value.faceVerification!,
        (value) {
      return _then(_value.copyWith(faceVerification: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationVerificationModelCopyWith<$Res>? get locationVerification {
    if (_value.locationVerification == null) {
      return null;
    }

    return $LocationVerificationModelCopyWith<$Res>(
        _value.locationVerification!, (value) {
      return _then(_value.copyWith(locationVerification: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VerificationsModelImplCopyWith<$Res>
    implements $VerificationsModelCopyWith<$Res> {
  factory _$$VerificationsModelImplCopyWith(_$VerificationsModelImpl value,
          $Res Function(_$VerificationsModelImpl) then) =
      __$$VerificationsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonSerializable(explicitToJson: true)
      FaceVerificationModel? faceVerification,
      @JsonSerializable(explicitToJson: true)
      LocationVerificationModel? locationVerification});

  @override
  $FaceVerificationModelCopyWith<$Res>? get faceVerification;
  @override
  $LocationVerificationModelCopyWith<$Res>? get locationVerification;
}

/// @nodoc
class __$$VerificationsModelImplCopyWithImpl<$Res>
    extends _$VerificationsModelCopyWithImpl<$Res, _$VerificationsModelImpl>
    implements _$$VerificationsModelImplCopyWith<$Res> {
  __$$VerificationsModelImplCopyWithImpl(_$VerificationsModelImpl _value,
      $Res Function(_$VerificationsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faceVerification = freezed,
    Object? locationVerification = freezed,
  }) {
    return _then(_$VerificationsModelImpl(
      faceVerification: freezed == faceVerification
          ? _value.faceVerification
          : faceVerification // ignore: cast_nullable_to_non_nullable
              as FaceVerificationModel?,
      locationVerification: freezed == locationVerification
          ? _value.locationVerification
          : locationVerification // ignore: cast_nullable_to_non_nullable
              as LocationVerificationModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerificationsModelImpl implements _VerificationsModel {
  const _$VerificationsModelImpl(
      {@JsonSerializable(explicitToJson: true) required this.faceVerification,
      @JsonSerializable(explicitToJson: true)
      required this.locationVerification});

  factory _$VerificationsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerificationsModelImplFromJson(json);

  @override
  @JsonSerializable(explicitToJson: true)
  final FaceVerificationModel? faceVerification;
  @override
  @JsonSerializable(explicitToJson: true)
  final LocationVerificationModel? locationVerification;

  @override
  String toString() {
    return 'VerificationsModel(faceVerification: $faceVerification, locationVerification: $locationVerification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationsModelImpl &&
            (identical(other.faceVerification, faceVerification) ||
                other.faceVerification == faceVerification) &&
            (identical(other.locationVerification, locationVerification) ||
                other.locationVerification == locationVerification));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, faceVerification, locationVerification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationsModelImplCopyWith<_$VerificationsModelImpl> get copyWith =>
      __$$VerificationsModelImplCopyWithImpl<_$VerificationsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationsModelImplToJson(
      this,
    );
  }
}

abstract class _VerificationsModel implements VerificationsModel {
  const factory _VerificationsModel(
          {@JsonSerializable(explicitToJson: true)
          required final FaceVerificationModel? faceVerification,
          @JsonSerializable(explicitToJson: true)
          required final LocationVerificationModel? locationVerification}) =
      _$VerificationsModelImpl;

  factory _VerificationsModel.fromJson(Map<String, dynamic> json) =
      _$VerificationsModelImpl.fromJson;

  @override
  @JsonSerializable(explicitToJson: true)
  FaceVerificationModel? get faceVerification;
  @override
  @JsonSerializable(explicitToJson: true)
  LocationVerificationModel? get locationVerification;
  @override
  @JsonKey(ignore: true)
  _$$VerificationsModelImplCopyWith<_$VerificationsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
