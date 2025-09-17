import 'package:freezed_annotation/freezed_annotation.dart';

import 'image.dart';
import 'name.dart';

part 'node.freezed.dart';
part 'node.g.dart';

@freezed
 sealed class Node with _$Node {
  factory Node({Name? name, Image? image}) = _Node;

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
}
