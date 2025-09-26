import 'package:freezed_annotation/freezed_annotation.dart';

part 'title.freezed.dart';
part 'title.g.dart';

@freezed
sealed  class Title with _$Title {
const factory Title({
		String? romaji,
		String? english,
	}) = _Title;

	factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);
}