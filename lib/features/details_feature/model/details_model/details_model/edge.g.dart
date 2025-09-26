// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Edge _$EdgeFromJson(Map<String, dynamic> json) => _Edge(
  node: json['node'] == null
      ? null
      : Node.fromJson(json['node'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EdgeToJson(_Edge instance) => <String, dynamic>{
  'node': instance.node,
};
