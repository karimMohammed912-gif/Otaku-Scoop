import 'package:freezed_annotation/freezed_annotation.dart';

import 'page.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
sealed  class Data with _$Data {
const	factory Data({
		Page? page,
	}) = _Data;

	@JsonKey(name: 'Page')
	Page? get pageKey => page;

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}