// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PageInfo _$PageInfoFromJson(Map<String, dynamic> json) => _PageInfo(
  perPage: (json['perPage'] as num?)?.toInt(),
  lastPage: (json['lastPage'] as num?)?.toInt(),
  hasNextPage: json['hasNextPage'] as bool?,
  currentPage: (json['currentPage'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$PageInfoToJson(_PageInfo instance) => <String, dynamic>{
  'perPage': instance.perPage,
  'lastPage': instance.lastPage,
  'hasNextPage': instance.hasNextPage,
  'currentPage': instance.currentPage,
  'total': instance.total,
};
