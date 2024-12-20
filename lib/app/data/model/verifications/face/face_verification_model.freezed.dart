// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_verification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FaceVerificationModel _$FaceVerificationModelFromJson(
    Map<String, dynamic> json) {
  return _FaceVerificationModel.fromJson(json);
}

/// @nodoc
mixin _$FaceVerificationModel {
  @JsonKey(includeIfNull: false)
  String? get userReason => throw _privateConstructorUsedError;
  bool? get faceVerified => throw _privateConstructorUsedError;
  String? get faceImagesUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FaceVerificationModelCopyWith<FaceVerificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaceVerificationModelCopyWith<$Res> {
  factory $FaceVerificationModelCopyWith(FaceVerificationModel value,
          $Res Function(FaceVerificationModel) then) =
      _$FaceVerificationModelCopyWithImpl<$Res, FaceVerificationModel>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? userReason,
      bool? faceVerified,
      String? faceImagesUrl});
}

/// @nodoc
class _$FaceVerificationModelCopyWithImpl<$Res,
        $Val extends FaceVerificationModel>
    implements $FaceVerificationModelCopyWith<$Res> {
  _$FaceVerificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userReason = freezed,
    Object? faceVerified = freezed,
    Object? faceImagesUrl = freezed,
  }) {
    return _then(_value.copyWith(
      userReason: freezed == userReason
          ? _value.userReason
          : userReason // ignore: cast_nullable_to_non_nullable
              as String?,
      faceVerified: freezed == faceVerified
          ? _value.faceVerified
          : faceVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      faceImagesUrl: freezed == faceImagesUrl
          ? _value.faceImagesUrl
          : faceImagesUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FaceVerificationModelImplCopyWith<$Res>
    implements $FaceVerificationModelCopyWith<$Res> {
  factory _$$FaceVerificationModelImplCopyWith(
          _$FaceVerificationModelImpl value,
          $Res Function(_$FaceVerificationModelImpl) then) =
      __$$FaceVerificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? userReason,
      bool? faceVerified,
      String? faceImagesUrl});
}

/// @nodoc
class __$$FaceVerificationModelImplCopyWithImpl<$Res>
    extends _$FaceVerificationModelCopyWithImpl<$Res,
        _$FaceVerificationModelImpl>
    implements _$$FaceVerificationModelImplCopyWith<$Res> {
  __$$FaceVerificationModelImplCopyWithImpl(_$FaceVerificationModelImpl _value,
      $Res Function(_$FaceVerificationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userReason = freezed,
    Object? faceVerified = freezed,
    Object? faceImagesUrl = freezed,
  }) {
    return _then(_$FaceVerificationModelImpl(
      userReason: freezed == userReason
          ? _value.userReason
          : userReason // ignore: cast_nullable_to_non_nullable
              as String?,
      faceVerified: freezed == faceVerified
          ? _value.faceVerified
          : faceVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      faceImagesUrl: freezed == faceImagesUrl
          ? _value.faceImagesUrl
          : faceImagesUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaceVerificationModelImpl implements _FaceVerificationModel {
  const _$FaceVerificationModelImpl(
      {@JsonKey(includeIfNull: false) this.userReason,
      required this.faceVerified,
      required this.faceImagesUrl});

  factory _$FaceVerificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaceVerificationModelImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final String? userReason;
  @override
  final bool? faceVerified;
  @override
  final String? faceImagesUrl;

  @override
  String toString() {
    return 'FaceVerificationModel(userReason: $userReason, faceVerified: $faceVerified, faceImagesUrl: $faceImagesUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceVerificationModelImpl &&
            (identical(other.userReason, userReason) ||
                other.userReason == userReason) &&
            (identical(other.faceVerified, faceVerified) ||
                other.faceVerified == faceVerified) &&
            (identical(other.faceImagesUrl, faceImagesUrl) ||
                other.faceImagesUrl == faceImagesUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userReason, faceVerified, faceImagesUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceVerificationModelImplCopyWith<_$FaceVerificationModelImpl>
      get copyWith => __$$FaceVerificationModelImplCopyWithImpl<
          _$FaceVerificationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaceVerificationModelImplToJson(
      this,
    );
  }
}

abstract class _FaceVerificationModel implements FaceVerificationModel {
  const factory _FaceVerificationModel(
      {@JsonKey(includeIfNull: false) final String? userReason,
      required final bool? faceVerified,
      required final String? faceImagesUrl}) = _$FaceVerificationModelImpl;

  factory _FaceVerificationModel.fromJson(Map<String, dynamic> json) =
      _$FaceVerificationModelImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  String? get userReason;
  @override
  bool? get faceVerified;
  @override
  String? get faceImagesUrl;
  @override
  @JsonKey(ignore: true)
  _$$FaceVerificationModelImplCopyWith<_$FaceVerificationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
