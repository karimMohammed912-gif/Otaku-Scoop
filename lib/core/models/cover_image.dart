import 'package:freezed_annotation/freezed_annotation.dart';

part 'cover_image.freezed.dart';
part 'cover_image.g.dart';

@freezed
sealed  class CoverImage with _$CoverImage {
	const factory CoverImage({
		String? large,
	}) = _CoverImage;

	factory CoverImage.fromJson(Map<String, dynamic> json) => _$CoverImageFromJson(json);
}