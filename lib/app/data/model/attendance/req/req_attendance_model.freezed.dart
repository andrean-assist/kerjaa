// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'req_attendance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReqAttendanceModel _$ReqAttendanceModelFromJson(Map<String, dynamic> json) {
  return _ReqAttendanceModel.fromJson(json);
}

/// @nodoc
mixin _$ReqAttendanceModel {
  String? get userId => throw _privateConstructorUsedError;
  String? get organizationId => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get shift => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get userReasonLocation => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get attendanceId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get approved => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  VerificationsModel? get verifications => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReqAttendanceModelCopyWith<ReqAttendanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReqAttendanceModelCopyWith<$Res> {
  factory $ReqAttendanceModelCopyWith(
          ReqAttendanceModel value, $Res Function(ReqAttendanceModel) then) =
      _$ReqAttendanceModelCopyWithImpl<$Res, ReqAttendanceModel>;
  @useResult
  $Res call(
      {String? userId,
      String? organizationId,
      String? date,
      String? shift,
      String? type,
      String? userReasonLocation,
      @JsonKey(includeIfNull: false) String? attendanceId,
      @JsonKey(includeIfNull: false) String? approved,
      @JsonKey(includeIfNull: false) VerificationsModel? verifications});

  $VerificationsModelCopyWith<$Res>? get verifications;
}

/// @nodoc
class _$ReqAttendanceModelCopyWithImpl<$Res, $Val extends ReqAttendanceModel>
    implements $ReqAttendanceModelCopyWith<$Res> {
  _$ReqAttendanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? organizationId = freezed,
    Object? date = freezed,
    Object? shift = freezed,
    Object? type = freezed,
    Object? userReasonLocation = freezed,
    Object? attendanceId = freezed,
    Object? approved = freezed,
    Object? verifications = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationId: freezed == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      shift: freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      userReasonLocation: freezed == userReasonLocation
          ? _value.userReasonLocation
          : userReasonLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      attendanceId: freezed == attendanceId
          ? _value.attendanceId
          : attendanceId // ignore: cast_nullable_to_non_nullable
              as String?,
      approved: freezed == approved
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as String?,
      verifications: freezed == verifications
          ? _value.verifications
          : verifications // ignore: cast_nullable_to_non_nullable
              as VerificationsModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VerificationsModelCopyWith<$Res>? get verifications {
    if (_value.verifications == null) {
      return null;
    }

    return $VerificationsModelCopyWith<$Res>(_value.verifications!, (value) {
      return _then(_value.copyWith(verifications: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReqAttendanceModelImplCopyWith<$Res>
    implements $ReqAttendanceModelCopyWith<$Res> {
  factory _$$ReqAttendanceModelImplCopyWith(_$ReqAttendanceModelImpl value,
          $Res Function(_$ReqAttendanceModelImpl) then) =
      __$$ReqAttendanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      String? organizationId,
      String? date,
      String? shift,
      String? type,
      String? userReasonLocation,
      @JsonKey(includeIfNull: false) String? attendanceId,
      @JsonKey(includeIfNull: false) String? approved,
      @JsonKey(includeIfNull: false) VerificationsModel? verifications});

  @override
  $VerificationsModelCopyWith<$Res>? get verifications;
}

/// @nodoc
class __$$ReqAttendanceModelImplCopyWithImpl<$Res>
    extends _$ReqAttendanceModelCopyWithImpl<$Res, _$ReqAttendanceModelImpl>
    implements _$$ReqAttendanceModelImplCopyWith<$Res> {
  __$$ReqAttendanceModelImplCopyWithImpl(_$ReqAttendanceModelImpl _value,
      $Res Function(_$ReqAttendanceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? organizationId = freezed,
    Object? date = freezed,
    Object? shift = freezed,
    Object? type = freezed,
    Object? userReasonLocation = freezed,
    Object? attendanceId = freezed,
    Object? approved = freezed,
    Object? verifications = freezed,
  }) {
    return _then(_$ReqAttendanceModelImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationId: freezed == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      shift: freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      userReasonLocation: freezed == userReasonLocation
          ? _value.userReasonLocation
          : userReasonLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      attendanceId: freezed == attendanceId
          ? _value.attendanceId
          : attendanceId // ignore: cast_nullable_to_non_nullable
              as String?,
      approved: freezed == approved
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as String?,
      verifications: freezed == verifications
          ? _value.verifications
          : verifications // ignore: cast_nullable_to_non_nullable
              as VerificationsModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReqAttendanceModelImpl implements _ReqAttendanceModel {
  const _$ReqAttendanceModelImpl(
      {required this.userId,
      required this.organizationId,
      required this.date,
      this.shift,
      this.type,
      this.userReasonLocation,
      @JsonKey(includeIfNull: false) this.attendanceId,
      @JsonKey(includeIfNull: false) this.approved,
      @JsonKey(includeIfNull: false) this.verifications});

  factory _$ReqAttendanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReqAttendanceModelImplFromJson(json);

  @override
  final String? userId;
  @override
  final String? organizationId;
  @override
  final String? date;
  @override
  final String? shift;
  @override
  final String? type;
  @override
  final String? userReasonLocation;
  @override
  @JsonKey(includeIfNull: false)
  final String? attendanceId;
  @override
  @JsonKey(includeIfNull: false)
  final String? approved;
  @override
  @JsonKey(includeIfNull: false)
  final VerificationsModel? verifications;

  @override
  String toString() {
    return 'ReqAttendanceModel(userId: $userId, organizationId: $organizationId, date: $date, shift: $shift, type: $type, userReasonLocation: $userReasonLocation, attendanceId: $attendanceId, approved: $approved, verifications: $verifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReqAttendanceModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.userReasonLocation, userReasonLocation) ||
                other.userReasonLocation == userReasonLocation) &&
            (identical(other.attendanceId, attendanceId) ||
                other.attendanceId == attendanceId) &&
            (identical(other.approved, approved) ||
                other.approved == approved) &&
            (identical(other.verifications, verifications) ||
                other.verifications == verifications));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, organizationId, date,
      shift, type, userReasonLocation, attendanceId, approved, verifications);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReqAttendanceModelImplCopyWith<_$ReqAttendanceModelImpl> get copyWith =>
      __$$ReqAttendanceModelImplCopyWithImpl<_$ReqAttendanceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReqAttendanceModelImplToJson(
      this,
    );
  }
}

abstract class _ReqAttendanceModel implements ReqAttendanceModel {
  const factory _ReqAttendanceModel(
      {required final String? userId,
      required final String? organizationId,
      required final String? date,
      final String? shift,
      final String? type,
      final String? userReasonLocation,
      @JsonKey(includeIfNull: false) final String? attendanceId,
      @JsonKey(includeIfNull: false) final String? approved,
      @JsonKey(includeIfNull: false)
      final VerificationsModel? verifications}) = _$ReqAttendanceModelImpl;

  factory _ReqAttendanceModel.fromJson(Map<String, dynamic> json) =
      _$ReqAttendanceModelImpl.fromJson;

  @override
  String? get userId;
  @override
  String? get organizationId;
  @override
  String? get date;
  @override
  String? get shift;
  @override
  String? get type;
  @override
  String? get userReasonLocation;
  @override
  @JsonKey(includeIfNull: false)
  String? get attendanceId;
  @override
  @JsonKey(includeIfNull: false)
  String? get approved;
  @override
  @JsonKey(includeIfNull: false)
  VerificationsModel? get verifications;
  @override
  @JsonKey(ignore: true)
  _$$ReqAttendanceModelImplCopyWith<_$ReqAttendanceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
