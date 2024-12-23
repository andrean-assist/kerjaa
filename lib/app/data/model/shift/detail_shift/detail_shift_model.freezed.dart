// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_shift_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailShiftModel _$DetailShiftModelFromJson(Map<String, dynamic> json) {
  return _DetailShiftModel.fromJson(json);
}

/// @nodoc
mixin _$DetailShiftModel {
  bool? get disabledShift => throw _privateConstructorUsedError;
  AbsenModel? get absen => throw _privateConstructorUsedError;
  AbsenModel? get istirahat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailShiftModelCopyWith<DetailShiftModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailShiftModelCopyWith<$Res> {
  factory $DetailShiftModelCopyWith(
          DetailShiftModel value, $Res Function(DetailShiftModel) then) =
      _$DetailShiftModelCopyWithImpl<$Res, DetailShiftModel>;
  @useResult
  $Res call({bool? disabledShift, AbsenModel? absen, AbsenModel? istirahat});

  $AbsenModelCopyWith<$Res>? get absen;
  $AbsenModelCopyWith<$Res>? get istirahat;
}

/// @nodoc
class _$DetailShiftModelCopyWithImpl<$Res, $Val extends DetailShiftModel>
    implements $DetailShiftModelCopyWith<$Res> {
  _$DetailShiftModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disabledShift = freezed,
    Object? absen = freezed,
    Object? istirahat = freezed,
  }) {
    return _then(_value.copyWith(
      disabledShift: freezed == disabledShift
          ? _value.disabledShift
          : disabledShift // ignore: cast_nullable_to_non_nullable
              as bool?,
      absen: freezed == absen
          ? _value.absen
          : absen // ignore: cast_nullable_to_non_nullable
              as AbsenModel?,
      istirahat: freezed == istirahat
          ? _value.istirahat
          : istirahat // ignore: cast_nullable_to_non_nullable
              as AbsenModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AbsenModelCopyWith<$Res>? get absen {
    if (_value.absen == null) {
      return null;
    }

    return $AbsenModelCopyWith<$Res>(_value.absen!, (value) {
      return _then(_value.copyWith(absen: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AbsenModelCopyWith<$Res>? get istirahat {
    if (_value.istirahat == null) {
      return null;
    }

    return $AbsenModelCopyWith<$Res>(_value.istirahat!, (value) {
      return _then(_value.copyWith(istirahat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailShiftModelImplCopyWith<$Res>
    implements $DetailShiftModelCopyWith<$Res> {
  factory _$$DetailShiftModelImplCopyWith(_$DetailShiftModelImpl value,
          $Res Function(_$DetailShiftModelImpl) then) =
      __$$DetailShiftModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? disabledShift, AbsenModel? absen, AbsenModel? istirahat});

  @override
  $AbsenModelCopyWith<$Res>? get absen;
  @override
  $AbsenModelCopyWith<$Res>? get istirahat;
}

/// @nodoc
class __$$DetailShiftModelImplCopyWithImpl<$Res>
    extends _$DetailShiftModelCopyWithImpl<$Res, _$DetailShiftModelImpl>
    implements _$$DetailShiftModelImplCopyWith<$Res> {
  __$$DetailShiftModelImplCopyWithImpl(_$DetailShiftModelImpl _value,
      $Res Function(_$DetailShiftModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disabledShift = freezed,
    Object? absen = freezed,
    Object? istirahat = freezed,
  }) {
    return _then(_$DetailShiftModelImpl(
      disabledShift: freezed == disabledShift
          ? _value.disabledShift
          : disabledShift // ignore: cast_nullable_to_non_nullable
              as bool?,
      absen: freezed == absen
          ? _value.absen
          : absen // ignore: cast_nullable_to_non_nullable
              as AbsenModel?,
      istirahat: freezed == istirahat
          ? _value.istirahat
          : istirahat // ignore: cast_nullable_to_non_nullable
              as AbsenModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailShiftModelImpl implements _DetailShiftModel {
  const _$DetailShiftModelImpl(
      {this.disabledShift, this.absen, this.istirahat});

  factory _$DetailShiftModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailShiftModelImplFromJson(json);

  @override
  final bool? disabledShift;
  @override
  final AbsenModel? absen;
  @override
  final AbsenModel? istirahat;

  @override
  String toString() {
    return 'DetailShiftModel(disabledShift: $disabledShift, absen: $absen, istirahat: $istirahat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailShiftModelImpl &&
            (identical(other.disabledShift, disabledShift) ||
                other.disabledShift == disabledShift) &&
            (identical(other.absen, absen) || other.absen == absen) &&
            (identical(other.istirahat, istirahat) ||
                other.istirahat == istirahat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, disabledShift, absen, istirahat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailShiftModelImplCopyWith<_$DetailShiftModelImpl> get copyWith =>
      __$$DetailShiftModelImplCopyWithImpl<_$DetailShiftModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailShiftModelImplToJson(
      this,
    );
  }
}

abstract class _DetailShiftModel implements DetailShiftModel {
  const factory _DetailShiftModel(
      {final bool? disabledShift,
      final AbsenModel? absen,
      final AbsenModel? istirahat}) = _$DetailShiftModelImpl;

  factory _DetailShiftModel.fromJson(Map<String, dynamic> json) =
      _$DetailShiftModelImpl.fromJson;

  @override
  bool? get disabledShift;
  @override
  AbsenModel? get absen;
  @override
  AbsenModel? get istirahat;
  @override
  @JsonKey(ignore: true)
  _$$DetailShiftModelImplCopyWith<_$DetailShiftModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
