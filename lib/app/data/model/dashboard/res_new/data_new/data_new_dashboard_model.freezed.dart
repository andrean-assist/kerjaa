// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_new_dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DataNewDashboardModel _$DataNewDashboardModelFromJson(
    Map<String, dynamic> json) {
  return _DataNewDashboardModel.fromJson(json);
}

/// @nodoc
mixin _$DataNewDashboardModel {
  OrganizationModel? get organization => throw _privateConstructorUsedError;
  DataAttendanceModel? get attendance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataNewDashboardModelCopyWith<DataNewDashboardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataNewDashboardModelCopyWith<$Res> {
  factory $DataNewDashboardModelCopyWith(DataNewDashboardModel value,
          $Res Function(DataNewDashboardModel) then) =
      _$DataNewDashboardModelCopyWithImpl<$Res, DataNewDashboardModel>;
  @useResult
  $Res call({OrganizationModel? organization, DataAttendanceModel? attendance});

  $OrganizationModelCopyWith<$Res>? get organization;
  $DataAttendanceModelCopyWith<$Res>? get attendance;
}

/// @nodoc
class _$DataNewDashboardModelCopyWithImpl<$Res,
        $Val extends DataNewDashboardModel>
    implements $DataNewDashboardModelCopyWith<$Res> {
  _$DataNewDashboardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organization = freezed,
    Object? attendance = freezed,
  }) {
    return _then(_value.copyWith(
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as OrganizationModel?,
      attendance: freezed == attendance
          ? _value.attendance
          : attendance // ignore: cast_nullable_to_non_nullable
              as DataAttendanceModel?,
    ) as $Val);
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
  $DataAttendanceModelCopyWith<$Res>? get attendance {
    if (_value.attendance == null) {
      return null;
    }

    return $DataAttendanceModelCopyWith<$Res>(_value.attendance!, (value) {
      return _then(_value.copyWith(attendance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataNewDashboardModelImplCopyWith<$Res>
    implements $DataNewDashboardModelCopyWith<$Res> {
  factory _$$DataNewDashboardModelImplCopyWith(
          _$DataNewDashboardModelImpl value,
          $Res Function(_$DataNewDashboardModelImpl) then) =
      __$$DataNewDashboardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OrganizationModel? organization, DataAttendanceModel? attendance});

  @override
  $OrganizationModelCopyWith<$Res>? get organization;
  @override
  $DataAttendanceModelCopyWith<$Res>? get attendance;
}

/// @nodoc
class __$$DataNewDashboardModelImplCopyWithImpl<$Res>
    extends _$DataNewDashboardModelCopyWithImpl<$Res,
        _$DataNewDashboardModelImpl>
    implements _$$DataNewDashboardModelImplCopyWith<$Res> {
  __$$DataNewDashboardModelImplCopyWithImpl(_$DataNewDashboardModelImpl _value,
      $Res Function(_$DataNewDashboardModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organization = freezed,
    Object? attendance = freezed,
  }) {
    return _then(_$DataNewDashboardModelImpl(
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as OrganizationModel?,
      attendance: freezed == attendance
          ? _value.attendance
          : attendance // ignore: cast_nullable_to_non_nullable
              as DataAttendanceModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataNewDashboardModelImpl implements _DataNewDashboardModel {
  const _$DataNewDashboardModelImpl({this.organization, this.attendance});

  factory _$DataNewDashboardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataNewDashboardModelImplFromJson(json);

  @override
  final OrganizationModel? organization;
  @override
  final DataAttendanceModel? attendance;

  @override
  String toString() {
    return 'DataNewDashboardModel(organization: $organization, attendance: $attendance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataNewDashboardModelImpl &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.attendance, attendance) ||
                other.attendance == attendance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, organization, attendance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataNewDashboardModelImplCopyWith<_$DataNewDashboardModelImpl>
      get copyWith => __$$DataNewDashboardModelImplCopyWithImpl<
          _$DataNewDashboardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataNewDashboardModelImplToJson(
      this,
    );
  }
}

abstract class _DataNewDashboardModel implements DataNewDashboardModel {
  const factory _DataNewDashboardModel(
      {final OrganizationModel? organization,
      final DataAttendanceModel? attendance}) = _$DataNewDashboardModelImpl;

  factory _DataNewDashboardModel.fromJson(Map<String, dynamic> json) =
      _$DataNewDashboardModelImpl.fromJson;

  @override
  OrganizationModel? get organization;
  @override
  DataAttendanceModel? get attendance;
  @override
  @JsonKey(ignore: true)
  _$$DataNewDashboardModelImplCopyWith<_$DataNewDashboardModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
