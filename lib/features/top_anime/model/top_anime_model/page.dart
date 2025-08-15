import 'package:freezed_annotation/freezed_annotation.dart';

import 'media.dart';

part 'page.freezed.dart';
part 'page.g.dart';

@freezed
sealed  class Page with _$Page {
	const factory Page({
		List<Media>? media,
	}) = _Page;

	factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
}