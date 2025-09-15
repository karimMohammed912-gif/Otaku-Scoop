import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otaku_scope/features/top_anime/models/page_info.dart';

import 'media.dart';

part 'page.freezed.dart';
part 'page.g.dart';

@freezed
sealed  class Page with _$Page {
	const factory Page({
    PageInfo? pageInfo,
		List<Media>? media,
	}) = _Page;

	factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
}