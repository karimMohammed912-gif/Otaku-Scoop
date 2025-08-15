// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Page _$PageFromJson(Map<String, dynamic> json) => _Page(
  media: (json['media'] as List<dynamic>?)
      ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PageToJson(_Page instance) => <String, dynamic>{
  'media': instance.media,
};
