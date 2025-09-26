import 'package:freezed_annotation/freezed_annotation.dart';

import 'node.dart';

part 'edge.freezed.dart';
part 'edge.g.dart';

@freezed
sealed class Edge with _$Edge {
  factory Edge({Node? node}) = _Edge;

  factory Edge.fromJson(Map<String, dynamic> json) => _$EdgeFromJson(json);
}
