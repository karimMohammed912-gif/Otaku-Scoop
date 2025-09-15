// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
  page: json['Page'] == null
      ? null
      : Page.fromJson(json['Page'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
  'Page': instance.page,
};
