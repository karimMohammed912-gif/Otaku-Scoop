import 'package:freezed_annotation/freezed_annotation.dart';

part 'date.freezed.dart';
part 'date.g.dart';

@freezed
sealed class Date with _$Date {
  factory Date({
    int? year,
    int? month,
    int? day,
  }) = _Date;

  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);
}
