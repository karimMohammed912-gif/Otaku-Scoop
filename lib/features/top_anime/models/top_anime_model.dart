import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'top_anime_model.freezed.dart';
part 'top_anime_model.g.dart';

@freezed
sealed  class TopAnimeModel with _$TopAnimeModel {
	const factory TopAnimeModel({
		Data? data,
	}) = _TopAnimeModel;

	factory TopAnimeModel.fromJson(Map<String, dynamic> json) => _$TopAnimeModelFromJson(json);
}