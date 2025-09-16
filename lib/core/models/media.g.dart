// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Media _$MediaFromJson(Map<String, dynamic> json) => _Media(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] == null
      ? null
      : Title.fromJson(json['title'] as Map<String, dynamic>),
  episodes: (json['episodes'] as num?)?.toInt(),
  averageScore: (json['averageScore'] as num?)?.toInt(),
  coverImage: json['coverImage'] == null
      ? null
      : CoverImage.fromJson(json['coverImage'] as Map<String, dynamic>),
  chapters: json['chapters'],
  volumes: json['volumes'],
);

Map<String, dynamic> _$MediaToJson(_Media instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'episodes': instance.episodes,
  'averageScore': instance.averageScore,
  'coverImage': instance.coverImage,
  'chapters': instance.chapters,
  'volumes': instance.volumes,
};
