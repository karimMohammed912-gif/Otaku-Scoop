import 'package:freezed_annotation/freezed_annotation.dart';

part 'name.freezed.dart';
part 'name.g.dart';

@freezed
sealed class Name with _$Name {
  factory Name({String? full}) = _Name;

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}
