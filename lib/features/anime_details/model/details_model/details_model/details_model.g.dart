// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetailsModel _$DetailsModelFromJson(Map<String, dynamic> json) =>
    _DetailsModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailsModelToJson(_DetailsModel instance) =>
    <String, dynamic>{'data': instance.data};
