// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Media {

 Title? get title; String? get description; int? get episodes; int? get duration; String? get status; List<String>? get genres; int? get averageScore; CoverImage? get coverImage; String? get bannerImage; Characters? get characters;
/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaCopyWith<Media> get copyWith => _$MediaCopyWithImpl<Media>(this as Media, _$identity);

  /// Serializes this Media to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Media&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.episodes, episodes) || other.episodes == episodes)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.averageScore, averageScore) || other.averageScore == averageScore)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage)&&(identical(other.bannerImage, bannerImage) || other.bannerImage == bannerImage)&&(identical(other.characters, characters) || other.characters == characters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,episodes,duration,status,const DeepCollectionEquality().hash(genres),averageScore,coverImage,bannerImage,characters);

@override
String toString() {
  return 'Media(title: $title, description: $description, episodes: $episodes, duration: $duration, status: $status, genres: $genres, averageScore: $averageScore, coverImage: $coverImage, bannerImage: $bannerImage, characters: $characters)';
}


}

/// @nodoc
abstract mixin class $MediaCopyWith<$Res>  {
  factory $MediaCopyWith(Media value, $Res Function(Media) _then) = _$MediaCopyWithImpl;
@useResult
$Res call({
 Title? title, String? description, int? episodes, int? duration, String? status, List<String>? genres, int? averageScore, CoverImage? coverImage, String? bannerImage, Characters? characters
});


$TitleCopyWith<$Res>? get title;$CoverImageCopyWith<$Res>? get coverImage;$CharactersCopyWith<$Res>? get characters;

}
/// @nodoc
class _$MediaCopyWithImpl<$Res>
    implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._self, this._then);

  final Media _self;
  final $Res Function(Media) _then;

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? description = freezed,Object? episodes = freezed,Object? duration = freezed,Object? status = freezed,Object? genres = freezed,Object? averageScore = freezed,Object? coverImage = freezed,Object? bannerImage = freezed,Object? characters = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Title?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,episodes: freezed == episodes ? _self.episodes : episodes // ignore: cast_nullable_to_non_nullable
as int?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,averageScore: freezed == averageScore ? _self.averageScore : averageScore // ignore: cast_nullable_to_non_nullable
as int?,coverImage: freezed == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as CoverImage?,bannerImage: freezed == bannerImage ? _self.bannerImage : bannerImage // ignore: cast_nullable_to_non_nullable
as String?,characters: freezed == characters ? _self.characters : characters // ignore: cast_nullable_to_non_nullable
as Characters?,
  ));
}
/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res>? get title {
    if (_self.title == null) {
    return null;
  }

  return $TitleCopyWith<$Res>(_self.title!, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoverImageCopyWith<$Res>? get coverImage {
    if (_self.coverImage == null) {
    return null;
  }

  return $CoverImageCopyWith<$Res>(_self.coverImage!, (value) {
    return _then(_self.copyWith(coverImage: value));
  });
}/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharactersCopyWith<$Res>? get characters {
    if (_self.characters == null) {
    return null;
  }

  return $CharactersCopyWith<$Res>(_self.characters!, (value) {
    return _then(_self.copyWith(characters: value));
  });
}
}


/// Adds pattern-matching-related methods to [Media].
extension MediaPatterns on Media {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Media value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Media() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Media value)  $default,){
final _that = this;
switch (_that) {
case _Media():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Media value)?  $default,){
final _that = this;
switch (_that) {
case _Media() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Title? title,  String? description,  int? episodes,  int? duration,  String? status,  List<String>? genres,  int? averageScore,  CoverImage? coverImage,  String? bannerImage,  Characters? characters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Media() when $default != null:
return $default(_that.title,_that.description,_that.episodes,_that.duration,_that.status,_that.genres,_that.averageScore,_that.coverImage,_that.bannerImage,_that.characters);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Title? title,  String? description,  int? episodes,  int? duration,  String? status,  List<String>? genres,  int? averageScore,  CoverImage? coverImage,  String? bannerImage,  Characters? characters)  $default,) {final _that = this;
switch (_that) {
case _Media():
return $default(_that.title,_that.description,_that.episodes,_that.duration,_that.status,_that.genres,_that.averageScore,_that.coverImage,_that.bannerImage,_that.characters);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Title? title,  String? description,  int? episodes,  int? duration,  String? status,  List<String>? genres,  int? averageScore,  CoverImage? coverImage,  String? bannerImage,  Characters? characters)?  $default,) {final _that = this;
switch (_that) {
case _Media() when $default != null:
return $default(_that.title,_that.description,_that.episodes,_that.duration,_that.status,_that.genres,_that.averageScore,_that.coverImage,_that.bannerImage,_that.characters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Media implements Media {
   _Media({this.title, this.description, this.episodes, this.duration, this.status, final  List<String>? genres, this.averageScore, this.coverImage, this.bannerImage, this.characters}): _genres = genres;
  factory _Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

@override final  Title? title;
@override final  String? description;
@override final  int? episodes;
@override final  int? duration;
@override final  String? status;
 final  List<String>? _genres;
@override List<String>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? averageScore;
@override final  CoverImage? coverImage;
@override final  String? bannerImage;
@override final  Characters? characters;

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaCopyWith<_Media> get copyWith => __$MediaCopyWithImpl<_Media>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Media&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.episodes, episodes) || other.episodes == episodes)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.averageScore, averageScore) || other.averageScore == averageScore)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage)&&(identical(other.bannerImage, bannerImage) || other.bannerImage == bannerImage)&&(identical(other.characters, characters) || other.characters == characters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,episodes,duration,status,const DeepCollectionEquality().hash(_genres),averageScore,coverImage,bannerImage,characters);

@override
String toString() {
  return 'Media(title: $title, description: $description, episodes: $episodes, duration: $duration, status: $status, genres: $genres, averageScore: $averageScore, coverImage: $coverImage, bannerImage: $bannerImage, characters: $characters)';
}


}

/// @nodoc
abstract mixin class _$MediaCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory _$MediaCopyWith(_Media value, $Res Function(_Media) _then) = __$MediaCopyWithImpl;
@override @useResult
$Res call({
 Title? title, String? description, int? episodes, int? duration, String? status, List<String>? genres, int? averageScore, CoverImage? coverImage, String? bannerImage, Characters? characters
});


@override $TitleCopyWith<$Res>? get title;@override $CoverImageCopyWith<$Res>? get coverImage;@override $CharactersCopyWith<$Res>? get characters;

}
/// @nodoc
class __$MediaCopyWithImpl<$Res>
    implements _$MediaCopyWith<$Res> {
  __$MediaCopyWithImpl(this._self, this._then);

  final _Media _self;
  final $Res Function(_Media) _then;

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? description = freezed,Object? episodes = freezed,Object? duration = freezed,Object? status = freezed,Object? genres = freezed,Object? averageScore = freezed,Object? coverImage = freezed,Object? bannerImage = freezed,Object? characters = freezed,}) {
  return _then(_Media(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Title?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,episodes: freezed == episodes ? _self.episodes : episodes // ignore: cast_nullable_to_non_nullable
as int?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,averageScore: freezed == averageScore ? _self.averageScore : averageScore // ignore: cast_nullable_to_non_nullable
as int?,coverImage: freezed == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as CoverImage?,bannerImage: freezed == bannerImage ? _self.bannerImage : bannerImage // ignore: cast_nullable_to_non_nullable
as String?,characters: freezed == characters ? _self.characters : characters // ignore: cast_nullable_to_non_nullable
as Characters?,
  ));
}

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TitleCopyWith<$Res>? get title {
    if (_self.title == null) {
    return null;
  }

  return $TitleCopyWith<$Res>(_self.title!, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoverImageCopyWith<$Res>? get coverImage {
    if (_self.coverImage == null) {
    return null;
  }

  return $CoverImageCopyWith<$Res>(_self.coverImage!, (value) {
    return _then(_self.copyWith(coverImage: value));
  });
}/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharactersCopyWith<$Res>? get characters {
    if (_self.characters == null) {
    return null;
  }

  return $CharactersCopyWith<$Res>(_self.characters!, (value) {
    return _then(_self.copyWith(characters: value));
  });
}
}

// dart format on
