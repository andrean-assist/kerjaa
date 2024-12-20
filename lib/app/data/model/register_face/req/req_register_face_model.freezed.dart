// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'req_register_face_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReqRegisterFaceModel _$ReqRegisterFaceModelFromJson(Map<String, dynamic> json) {
  return _ReqRegisterFaceModel.fromJson(json);
}

/// @nodoc
mixin _$ReqRegisterFaceModel {
  String? get avatar => throw _privateConstructorUsedError;
  bool? get isVerified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReqRegisterFaceModelCopyWith<ReqRegisterFaceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReqRegisterFaceModelCopyWith<$Res> {
  factory $ReqRegisterFaceModelCopyWith(ReqRegisterFaceModel value,
          $Res Function(ReqRegisterFaceModel) then) =
      _$ReqRegisterFaceModelCopyWithImpl<$Res, ReqRegisterFaceModel>;
  @useResult
  $Res call({String? avatar, bool? isVerified});
}

/// @nodoc
class _$ReqRegisterFaceModelCopyWithImpl<$Res,
        $Val extends ReqRegisterFaceModel>
    implements $ReqRegisterFaceModelCopyWith<$Res> {
  _$ReqRegisterFaceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatar = freezed,
    Object? isVerified = freezed,
  }) {
    return _then(_value.copyWith(
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReqRegisterFaceModelImplCopyWith<$Res>
    implements $ReqRegisterFaceModelCopyWith<$Res> {
  factory _$$ReqRegisterFaceModelImplCopyWith(_$ReqRegisterFaceModelImpl value,
          $Res Function(_$ReqRegisterFaceModelImpl) then) =
      __$$ReqRegisterFaceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? avatar, bool? isVerified});
}

/// @nodoc
class __$$ReqRegisterFaceModelImplCopyWithImpl<$Res>
    extends _$ReqRegisterFaceModelCopyWithImpl<$Res, _$ReqRegisterFaceModelImpl>
    implements _$$ReqRegisterFaceModelImplCopyWith<$Res> {
  __$$ReqRegisterFaceModelImplCopyWithImpl(_$ReqRegisterFaceModelImpl _value,
      $Res Function(_$ReqRegisterFaceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatar = freezed,
    Object? isVerified = freezed,
  }) {
    return _then(_$ReqRegisterFaceModelImpl(
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReqRegisterFaceModelImpl implements _ReqRegisterFaceModel {
  const _$ReqRegisterFaceModelImpl(
      {required this.avatar, required this.isVerified});

  factory _$ReqRegisterFaceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReqRegisterFaceModelImplFromJson(json);

  @override
  final String? avatar;
  @override
  final bool? isVerified;

  @override
  String toString() {
    return 'ReqRegisterFaceModel(avatar: $avatar, isVerified: $isVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReqRegisterFaceModelImpl &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, avatar, isVerified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReqRegisterFaceModelImplCopyWith<_$ReqRegisterFaceModelImpl>
      get copyWith =>
          __$$ReqRegisterFaceModelImplCopyWithImpl<_$ReqRegisterFaceModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReqRegisterFaceModelImplToJson(
      this,
    );
  }
}

abstract class _ReqRegisterFaceModel implements ReqRegisterFaceModel {
  const factory _ReqRegisterFaceModel(
      {required final String? avatar,
      required final bool? isVerified}) = _$ReqRegisterFaceModelImpl;

  factory _ReqRegisterFaceModel.fromJson(Map<String, dynamic> json) =
      _$ReqRegisterFaceModelImpl.fromJson;

  @override
  String? get avatar;
  @override
  bool? get isVerified;
  @override
  @JsonKey(ignore: true)
  _$$ReqRegisterFaceModelImplCopyWith<_$ReqRegisterFaceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
