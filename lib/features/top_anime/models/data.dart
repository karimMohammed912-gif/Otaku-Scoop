import 'package:freezed_annotation/freezed_annotation.dart';

import 'page.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
sealed class Data with _$Data {
  const factory Data({
    // FIX: Add this annotation to map the JSON key 'Page' to this property.
    @JsonKey(name: 'Page') Page? page,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}