// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DataDashboardModel _$DataDashboardModelFromJson(Map<String, dynamic> json) {
  return _DataDashboardModel.fromJson(json);
}

/// @nodoc
mixin _$DataDashboardModel {
  DataAttendanceModel? get attendance => throw _privateConstructorUsedError;
  OrganizationModel? get organization => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataDashboardModelCopyWith<DataDashboardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataDashboardModelCopyWith<$Res> {
  factory $DataDashboardModelCopyWith(
          DataDashboardModel value, $Res Function(DataDashboardModel) then) =
      _$DataDashboardModelCopyWithImpl<$Res, DataDashboardModel>;
  @useResult
  $Res call(
      {DataAttendanceModel? attendance,
      OrganizationModel? organization,
      UserModel? user});

  $DataAttendanceModelCopyWith<$Res>? get attendance;
  $OrganizationModelCopyWith<$Res>? get organization;
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$DataDashboardModelCopyWithImpl<$Res, $Val extends DataDashboardModel>
    implements $DataDashboardModelCopyWith<$Res> {
  _$DataDashboardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendance = freezed,
    Object? organization = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      attendance: freezed == attendance
          ? _value.attendance
          : attendance // ignore: cast_nullable_to_non_nullable
              as DataAttendanceModel?,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as OrganizationModel?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataAttendanceModelCopyWith<$Res>? get attendance {
    if (_value.attendance == null) {
      return null;
    }

    return $DataAttendanceModelCopyWith<$Res>(_value.attendance!, (value) {
      return _then(_value.copyWith(attendance: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrganizationModelCopyWith<$Res>? get organization {
    if (_value.organization == null) {
      return null;
    }

    return $OrganizationModelCopyWith<$Res>(_value.organization!, (value) {
      return _then(_value.copyWith(organization: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataDashboardModelImplCopyWith<$Res>
    implements $DataDashboardModelCopyWith<$Res> {
  factory _$$DataDashboardModelImplCopyWith(_$DataDashboardModelImpl value,
          $Res Function(_$DataDashboardModelImpl) then) =
      __$$DataDashboardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataAttendanceModel? attendance,
      OrganizationModel? organization,
      UserModel? user});

  @override
  $DataAttendanceModelCopyWith<$Res>? get attendance;
  @override
  $OrganizationModelCopyWith<$Res>? get organization;
  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$DataDashboardModelImplCopyWithImpl<$Res>
    extends _$DataDashboardModelCopyWithImpl<$Res, _$DataDashboardModelImpl>
    implements _$$DataDashboardModelImplCopyWith<$Res> {
  __$$DataDashboardModelImplCopyWithImpl(_$DataDashboardModelImpl _value,
      $Res Function(_$DataDashboardModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendance = freezed,
    Object? organization = freezed,
    Object? user = freezed,
  }) {
    return _then(_$DataDashboardModelImpl(
      attendance: freezed == attendance
          ? _value.attendance
          : attendance // ignore: cast_nullable_to_non_nullable
              as DataAttendanceModel?,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as OrganizationModel?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataDashboardModelImpl implements _DataDashboardModel {
  const _$DataDashboardModelImpl(
      {this.attendance, this.organization, this.user});

  factory _$DataDashboardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataDashboardModelImplFromJson(json);

  @override
  final DataAttendanceModel? attendance;
  @override
  final OrganizationModel? organization;
  @override
  final UserModel? user;

  @override
  String toString() {
    return 'DataDashboardModel(attendance: $attendance, organization: $organization, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataDashboardModelImpl &&
            (identical(other.attendance, attendance) ||
                other.attendance == attendance) &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, attendance, organization, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataDashboardModelImplCopyWith<_$DataDashboardModelImpl> get copyWith =>
      __$$DataDashboardModelImplCopyWithImpl<_$DataDashboardModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataDashboardModelImplToJson(
      this,
    );
  }
}

abstract class _DataDashboardModel implements DataDashboardModel {
  const factory _DataDashboardModel(
      {final DataAttendanceModel? attendance,
      final OrganizationModel? organization,
      final UserModel? user}) = _$DataDashboardModelImpl;

  factory _DataDashboardModel.fromJson(Map<String, dynamic> json) =
      _$DataDashboardModelImpl.fromJson;

  @override
  DataAttendanceModel? get attendance;
  @override
  OrganizationModel? get organization;
  @override
  UserModel? get user;
  @override
  @JsonKey(ignore: true)
  _$$DataDashboardModelImplCopyWith<_$DataDashboardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
