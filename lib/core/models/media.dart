import 'package:freezed_annotation/freezed_annotation.dart';

import 'cover_image.dart';
import 'title.dart';

part 'media.freezed.dart';
part 'media.g.dart';

@freezed
sealed  class Media with _$Media {
	const factory Media({
		int? id,
		Title? title,
    int? episodes,
    int? averageScore,

		CoverImage? coverImage,
		dynamic chapters,
		dynamic volumes,

	}) = _Media;

	factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}