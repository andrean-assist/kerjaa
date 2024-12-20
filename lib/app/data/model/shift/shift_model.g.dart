// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShiftModelImpl _$$ShiftModelImplFromJson(Map<String, dynamic> json) =>
    _$ShiftModelImpl(
      pagi: json['pagi'] == null
          ? null
          : DetailShiftModel.fromJson(json['pagi'] as Map<String, dynamic>),
      siang: json['siang'] == null
          ? null
          : DetailShiftModel.fromJson(json['siang'] as Map<String, dynamic>),
      malam: json['malam'] == null
          ? null
          : DetailShiftModel.fromJson(json['malam'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ShiftModelImplToJson(_$ShiftModelImpl instance) =>
    <String, dynamic>{
      'pagi': instance.pagi,
      'siang': instance.siang,
      'malam': instance.malam,
    };
