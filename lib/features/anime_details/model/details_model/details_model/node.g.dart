// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Node _$NodeFromJson(Map<String, dynamic> json) => _Node(
  name: json['name'] == null
      ? null
      : Name.fromJson(json['name'] as Map<String, dynamic>),
  image: json['image'] == null
      ? null
      : Image.fromJson(json['image'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NodeToJson(_Node instance) => <String, dynamic>{
  'name': instance.name,
  'image': instance.image,
};
