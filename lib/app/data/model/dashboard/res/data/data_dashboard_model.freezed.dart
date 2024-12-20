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
  String? get userId => throw _privateConstructorUsedError;
  String? get organizationId => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  List<EventsModel>? get events => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get checkIn => throw _privateConstructorUsedError;
  String? get breakStart => throw _privateConstructorUsedError;
  String? get breakStop => throw _privateConstructorUsedError;
  String? get checkOut => throw _privateConstructorUsedError;
  String? get workHours => throw _privateConstructorUsedError;
  String? get breakHours => throw _privateConstructorUsedError;
  String? get uniqueCode => throw _privateConstructorUsedError;
  PositionModel? get position => throw _privateConstructorUsedError;
  num? get radius => throw _privateConstructorUsedError;
  ShiftModel? get shift => throw _privateConstructorUsedError;
  bool? get isMobile => throw _privateConstructorUsedError;

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
      {String? userId,
      String? organizationId,
      String? date,
      String? status,
      List<EventsModel>? events,
      String? createdAt,
      String? updatedAt,
      bool? isDeleted,
      String? id,
      String? checkIn,
      String? breakStart,
      String? breakStop,
      String? checkOut,
      String? workHours,
      String? breakHours,
      String? uniqueCode,
      PositionModel? position,
      num? radius,
      ShiftModel? shift,
      bool? isMobile});

  $PositionModelCopyWith<$Res>? get position;
  $ShiftModelCopyWith<$Res>? get shift;
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
    Object? userId = freezed,
    Object? organizationId = freezed,
    Object? date = freezed,
    Object? status = freezed,
    Object? events = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isDeleted = freezed,
    Object? id = freezed,
    Object? checkIn = freezed,
    Object? breakStart = freezed,
    Object? breakStop = freezed,
    Object? checkOut = freezed,
    Object? workHours = freezed,
    Object? breakHours = freezed,
    Object? uniqueCode = freezed,
    Object? position = freezed,
    Object? radius = freezed,
    Object? shift = freezed,
    Object? isMobile = freezed,
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      events: freezed == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventsModel>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      checkIn: freezed == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String?,
      breakStart: freezed == breakStart
          ? _value.breakStart
          : breakStart // ignore: cast_nullable_to_non_nullable
              as String?,
      breakStop: freezed == breakStop
          ? _value.breakStop
          : breakStop // ignore: cast_nullable_to_non_nullable
              as String?,
      checkOut: freezed == checkOut
          ? _value.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as String?,
      workHours: freezed == workHours
          ? _value.workHours
          : workHours // ignore: cast_nullable_to_non_nullable
              as String?,
      breakHours: freezed == breakHours
          ? _value.breakHours
          : breakHours // ignore: cast_nullable_to_non_nullable
              as String?,
      uniqueCode: freezed == uniqueCode
          ? _value.uniqueCode
          : uniqueCode // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as PositionModel?,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as num?,
      shift: freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftModel?,
      isMobile: freezed == isMobile
          ? _value.isMobile
          : isMobile // ignore: cast_nullable_to_non_nullable
              as bool?,
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
abstract class _$$DataDashboardModelImplCopyWith<$Res>
    implements $DataDashboardModelCopyWith<$Res> {
  factory _$$DataDashboardModelImplCopyWith(_$DataDashboardModelImpl value,
          $Res Function(_$DataDashboardModelImpl) then) =
      __$$DataDashboardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      String? organizationId,
      String? date,
      String? status,
      List<EventsModel>? events,
      String? createdAt,
      String? updatedAt,
      bool? isDeleted,
      String? id,
      String? checkIn,
      String? breakStart,
      String? breakStop,
      String? checkOut,
      String? workHours,
      String? breakHours,
      String? uniqueCode,
      PositionModel? position,
      num? radius,
      ShiftModel? shift,
      bool? isMobile});

  @override
  $PositionModelCopyWith<$Res>? get position;
  @override
  $ShiftModelCopyWith<$Res>? get shift;
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
    Object? userId = freezed,
    Object? organizationId = freezed,
    Object? date = freezed,
    Object? status = freezed,
    Object? events = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isDeleted = freezed,
    Object? id = freezed,
    Object? checkIn = freezed,
    Object? breakStart = freezed,
    Object? breakStop = freezed,
    Object? checkOut = freezed,
    Object? workHours = freezed,
    Object? breakHours = freezed,
    Object? uniqueCode = freezed,
    Object? position = freezed,
    Object? radius = freezed,
    Object? shift = freezed,
    Object? isMobile = freezed,
  }) {
    return _then(_$DataDashboardModelImpl(
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      events: freezed == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventsModel>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      checkIn: freezed == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String?,
      breakStart: freezed == breakStart
          ? _value.breakStart
          : breakStart // ignore: cast_nullable_to_non_nullable
              as String?,
      breakStop: freezed == breakStop
          ? _value.breakStop
          : breakStop // ignore: cast_nullable_to_non_nullable
              as String?,
      checkOut: freezed == checkOut
          ? _value.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as String?,
      workHours: freezed == workHours
          ? _value.workHours
          : workHours // ignore: cast_nullable_to_non_nullable
              as String?,
      breakHours: freezed == breakHours
          ? _value.breakHours
          : breakHours // ignore: cast_nullable_to_non_nullable
              as String?,
      uniqueCode: freezed == uniqueCode
          ? _value.uniqueCode
          : uniqueCode // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as PositionModel?,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as num?,
      shift: freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftModel?,
      isMobile: freezed == isMobile
          ? _value.isMobile
          : isMobile // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataDashboardModelImpl implements _DataDashboardModel {
  const _$DataDashboardModelImpl(
      {this.userId,
      this.organizationId,
      this.date,
      this.status,
      final List<EventsModel>? events,
      this.createdAt,
      this.updatedAt,
      this.isDeleted,
      this.id,
      this.checkIn,
      this.breakStart,
      this.breakStop,
      this.checkOut,
      this.workHours,
      this.breakHours,
      this.uniqueCode,
      this.position,
      this.radius,
      this.shift,
      this.isMobile})
      : _events = events;

  factory _$DataDashboardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataDashboardModelImplFromJson(json);

  @override
  final String? userId;
  @override
  final String? organizationId;
  @override
  final String? date;
  @override
  final String? status;
  final List<EventsModel>? _events;
  @override
  List<EventsModel>? get events {
    final value = _events;
    if (value == null) return null;
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final bool? isDeleted;
  @override
  final String? id;
  @override
  final String? checkIn;
  @override
  final String? breakStart;
  @override
  final String? breakStop;
  @override
  final String? checkOut;
  @override
  final String? workHours;
  @override
  final String? breakHours;
  @override
  final String? uniqueCode;
  @override
  final PositionModel? position;
  @override
  final num? radius;
  @override
  final ShiftModel? shift;
  @override
  final bool? isMobile;

  @override
  String toString() {
    return 'DataDashboardModel(userId: $userId, organizationId: $organizationId, date: $date, status: $status, events: $events, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted, id: $id, checkIn: $checkIn, breakStart: $breakStart, breakStop: $breakStop, checkOut: $checkOut, workHours: $workHours, breakHours: $breakHours, uniqueCode: $uniqueCode, position: $position, radius: $radius, shift: $shift, isMobile: $isMobile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataDashboardModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.breakStart, breakStart) ||
                other.breakStart == breakStart) &&
            (identical(other.breakStop, breakStop) ||
                other.breakStop == breakStop) &&
            (identical(other.checkOut, checkOut) ||
                other.checkOut == checkOut) &&
            (identical(other.workHours, workHours) ||
                other.workHours == workHours) &&
            (identical(other.breakHours, breakHours) ||
                other.breakHours == breakHours) &&
            (identical(other.uniqueCode, uniqueCode) ||
                other.uniqueCode == uniqueCode) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.radius, radius) || other.radius == radius) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.isMobile, isMobile) ||
                other.isMobile == isMobile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        userId,
        organizationId,
        date,
        status,
        const DeepCollectionEquality().hash(_events),
        createdAt,
        updatedAt,
        isDeleted,
        id,
        checkIn,
        breakStart,
        breakStop,
        checkOut,
        workHours,
        breakHours,
        uniqueCode,
        position,
        radius,
        shift,
        isMobile
      ]);

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
      {final String? userId,
      final String? organizationId,
      final String? date,
      final String? status,
      final List<EventsModel>? events,
      final String? createdAt,
      final String? updatedAt,
      final bool? isDeleted,
      final String? id,
      final String? checkIn,
      final String? breakStart,
      final String? breakStop,
      final String? checkOut,
      final String? workHours,
      final String? breakHours,
      final String? uniqueCode,
      final PositionModel? position,
      final num? radius,
      final ShiftModel? shift,
      final bool? isMobile}) = _$DataDashboardModelImpl;

  factory _DataDashboardModel.fromJson(Map<String, dynamic> json) =
      _$DataDashboardModelImpl.fromJson;

  @override
  String? get userId;
  @override
  String? get organizationId;
  @override
  String? get date;
  @override
  String? get status;
  @override
  List<EventsModel>? get events;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  bool? get isDeleted;
  @override
  String? get id;
  @override
  String? get checkIn;
  @override
  String? get breakStart;
  @override
  String? get breakStop;
  @override
  String? get checkOut;
  @override
  String? get workHours;
  @override
  String? get breakHours;
  @override
  String? get uniqueCode;
  @override
  PositionModel? get position;
  @override
  num? get radius;
  @override
  ShiftModel? get shift;
  @override
  bool? get isMobile;
  @override
  @JsonKey(ignore: true)
  _$$DataDashboardModelImplCopyWith<_$DataDashboardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
