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
  coverImage: json['coverImage'] == null
      ? null
      : CoverImage.fromJson(json['coverImage'] as Map<String, dynamic>),
  chapters: json['chapters'],
  volumes: json['volumes'],
  averageScore: (json['averageScore'] as num?)?.toInt(),
);

Map<String, dynamic> _$MediaToJson(_Media instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'coverImage': instance.coverImage,
  'chapters': instance.chapters,
  'volumes': instance.volumes,
  'averageScore': instance.averageScore,
};
