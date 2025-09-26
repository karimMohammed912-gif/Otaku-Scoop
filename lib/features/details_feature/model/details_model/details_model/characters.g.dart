// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Characters _$CharactersFromJson(Map<String, dynamic> json) => _Characters(
  edges: (json['edges'] as List<dynamic>?)
      ?.map((e) => Edge.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CharactersToJson(_Characters instance) =>
    <String, dynamic>{'edges': instance.edges};
