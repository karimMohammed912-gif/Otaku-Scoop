// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Media _$MediaFromJson(Map<String, dynamic> json) => _Media(
  title: json['title'] == null
      ? null
      : Title.fromJson(json['title'] as Map<String, dynamic>),
  description: json['description'] as String?,
  episodes: (json['episodes'] as num?)?.toInt(),
  duration: (json['duration'] as num?)?.toInt(),
  status: json['status'] as String?,
  genres: (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
  averageScore: (json['averageScore'] as num?)?.toInt(),
  coverImage: json['coverImage'] == null
      ? null
      : CoverImage.fromJson(json['coverImage'] as Map<String, dynamic>),
  bannerImage: json['bannerImage'] as String?,
  characters: json['characters'] == null
      ? null
      : Characters.fromJson(json['characters'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MediaToJson(_Media instance) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'episodes': instance.episodes,
  'duration': instance.duration,
  'status': instance.status,
  'genres': instance.genres,
  'averageScore': instance.averageScore,
  'coverImage': instance.coverImage,
  'bannerImage': instance.bannerImage,
  'characters': instance.characters,
};
