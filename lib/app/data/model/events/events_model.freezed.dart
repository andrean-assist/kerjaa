// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventsModel _$EventsModelFromJson(Map<String, dynamic> json) {
  return _EventsModel.fromJson(json);
}

/// @nodoc
mixin _$EventsModel {
  String? get eventType => throw _privateConstructorUsedError;
  String? get eventTime => throw _privateConstructorUsedError;
  String? get approved => throw _privateConstructorUsedError;
  String? get verifiedAt => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  VerificationsModel? get verifications => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventsModelCopyWith<EventsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventsModelCopyWith<$Res> {
  factory $EventsModelCopyWith(
          EventsModel value, $Res Function(EventsModel) then) =
      _$EventsModelCopyWithImpl<$Res, EventsModel>;
  @useResult
  $Res call(
      {String? eventType,
      String? eventTime,
      String? approved,
      String? verifiedAt,
      @JsonKey(includeToJson: false) VerificationsModel? verifications});

  $VerificationsModelCopyWith<$Res>? get verifications;
}

/// @nodoc
class _$EventsModelCopyWithImpl<$Res, $Val extends EventsModel>
    implements $EventsModelCopyWith<$Res> {
  _$EventsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = freezed,
    Object? eventTime = freezed,
    Object? approved = freezed,
    Object? verifiedAt = freezed,
    Object? verifications = freezed,
  }) {
    return _then(_value.copyWith(
      eventType: freezed == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String?,
      eventTime: freezed == eventTime
          ? _value.eventTime
          : eventTime // ignore: cast_nullable_to_non_nullable
              as String?,
      approved: freezed == approved
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedAt: freezed == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
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
abstract class _$$EventsModelImplCopyWith<$Res>
    implements $EventsModelCopyWith<$Res> {
  factory _$$EventsModelImplCopyWith(
          _$EventsModelImpl value, $Res Function(_$EventsModelImpl) then) =
      __$$EventsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? eventType,
      String? eventTime,
      String? approved,
      String? verifiedAt,
      @JsonKey(includeToJson: false) VerificationsModel? verifications});

  @override
  $VerificationsModelCopyWith<$Res>? get verifications;
}

/// @nodoc
class __$$EventsModelImplCopyWithImpl<$Res>
    extends _$EventsModelCopyWithImpl<$Res, _$EventsModelImpl>
    implements _$$EventsModelImplCopyWith<$Res> {
  __$$EventsModelImplCopyWithImpl(
      _$EventsModelImpl _value, $Res Function(_$EventsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = freezed,
    Object? eventTime = freezed,
    Object? approved = freezed,
    Object? verifiedAt = freezed,
    Object? verifications = freezed,
  }) {
    return _then(_$EventsModelImpl(
      eventType: freezed == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String?,
      eventTime: freezed == eventTime
          ? _value.eventTime
          : eventTime // ignore: cast_nullable_to_non_nullable
              as String?,
      approved: freezed == approved
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedAt: freezed == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
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
class _$EventsModelImpl implements _EventsModel {
  const _$EventsModelImpl(
      {this.eventType,
      this.eventTime,
      this.approved,
      this.verifiedAt,
      @JsonKey(includeToJson: false) this.verifications});

  factory _$EventsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventsModelImplFromJson(json);

  @override
  final String? eventType;
  @override
  final String? eventTime;
  @override
  final String? approved;
  @override
  final String? verifiedAt;
  @override
  @JsonKey(includeToJson: false)
  final VerificationsModel? verifications;

  @override
  String toString() {
    return 'EventsModel(eventType: $eventType, eventTime: $eventTime, approved: $approved, verifiedAt: $verifiedAt, verifications: $verifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventsModelImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.eventTime, eventTime) ||
                other.eventTime == eventTime) &&
            (identical(other.approved, approved) ||
                other.approved == approved) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.verifications, verifications) ||
                other.verifications == verifications));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, eventType, eventTime, approved, verifiedAt, verifications);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventsModelImplCopyWith<_$EventsModelImpl> get copyWith =>
      __$$EventsModelImplCopyWithImpl<_$EventsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventsModelImplToJson(
      this,
    );
  }
}

abstract class _EventsModel implements EventsModel {
  const factory _EventsModel(
      {final String? eventType,
      final String? eventTime,
      final String? approved,
      final String? verifiedAt,
      @JsonKey(includeToJson: false)
      final VerificationsModel? verifications}) = _$EventsModelImpl;

  factory _EventsModel.fromJson(Map<String, dynamic> json) =
      _$EventsModelImpl.fromJson;

  @override
  String? get eventType;
  @override
  String? get eventTime;
  @override
  String? get approved;
  @override
  String? get verifiedAt;
  @override
  @JsonKey(includeToJson: false)
  VerificationsModel? get verifications;
  @override
  @JsonKey(ignore: true)
  _$$EventsModelImplCopyWith<_$EventsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
