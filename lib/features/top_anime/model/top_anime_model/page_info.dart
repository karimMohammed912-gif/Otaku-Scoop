import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_info.freezed.dart';
part 'page_info.g.dart';

@freezed
sealed class PageInfo with _$PageInfo {
  const factory PageInfo({
    int? perPage,
    int? lastPage,
    bool? hasNextPage,
    int? currentPage,
    int? total,
  }) = _PageInfo;

  factory PageInfo.fromJson(Map<String, dynamic> json) => _$PageInfoFromJson(json);
}