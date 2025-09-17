import 'package:freezed_annotation/freezed_annotation.dart';

import 'media.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
sealed class Data with _$Data {
  factory Data({@JsonKey(name: 'Media') Media? media}) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
