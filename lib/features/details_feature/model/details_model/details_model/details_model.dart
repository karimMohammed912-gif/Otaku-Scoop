import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'details_model.freezed.dart';
part 'details_model.g.dart';

@freezed
sealed class DetailsModel with _$DetailsModel {
  factory DetailsModel({Data? data}) = _DetailsModel;

  factory DetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DetailsModelFromJson(json);
}
