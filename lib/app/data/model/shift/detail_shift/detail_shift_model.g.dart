// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_shift_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailShiftModelImpl _$$DetailShiftModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailShiftModelImpl(
      absen: json['absen'] == null
          ? null
          : AbsenModel.fromJson(json['absen'] as Map<String, dynamic>),
      istirahat: json['istirahat'] == null
          ? null
          : AbsenModel.fromJson(json['istirahat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailShiftModelImplToJson(
        _$DetailShiftModelImpl instance) =>
    <String, dynamic>{
      'absen': instance.absen,
      'istirahat': instance.istirahat,
    };
