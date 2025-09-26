import 'package:freezed_annotation/freezed_annotation.dart';

import 'characters.dart';
import 'cover_image.dart';
import 'title.dart';
import 'date.dart';

part 'media.freezed.dart';
part 'media.g.dart';

@freezed
sealed class Media with _$Media {
  factory Media({
    Title? title,
    Date? startDate,
    Date? endDate,
    String? description,
    // Anime specific
    int? episodes,
    int? duration,
    // Manga specific
    int? chapters,
    int? volumes,
    // Common
    String? status,
    List<String>? genres,
    int? averageScore,
    CoverImage? coverImage,
    String? bannerImage,
    Characters? characters,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}
