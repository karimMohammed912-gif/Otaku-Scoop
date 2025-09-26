import 'package:freezed_annotation/freezed_annotation.dart';

import 'edge.dart';

part 'characters.freezed.dart';
part 'characters.g.dart';

@freezed
sealed class Characters with _$Characters {
  factory Characters({List<Edge>? edges}) = _Characters;

  factory Characters.fromJson(Map<String, dynamic> json) =>
      _$CharactersFromJson(json);
}
