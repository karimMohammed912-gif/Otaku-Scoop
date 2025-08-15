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

 int? get id; Title? get title; CoverImage? get coverImage; dynamic get chapters; dynamic get volumes; int? get averageScore;
/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaCopyWith<Media> get copyWith => _$MediaCopyWithImpl<Media>(this as Media, _$identity);

  /// Serializes this Media to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Media&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage)&&const DeepCollectionEquality().equals(other.chapters, chapters)&&const DeepCollectionEquality().equals(other.volumes, volumes)&&(identical(other.averageScore, averageScore) || other.averageScore == averageScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,coverImage,const DeepCollectionEquality().hash(chapters),const DeepCollectionEquality().hash(volumes),averageScore);

@override
String toString() {
  return 'Media(id: $id, title: $title, coverImage: $coverImage, chapters: $chapters, volumes: $volumes, averageScore: $averageScore)';
}


}

/// @nodoc
abstract mixin class $MediaCopyWith<$Res>  {
  factory $MediaCopyWith(Media value, $Res Function(Media) _then) = _$MediaCopyWithImpl;
@useResult
$Res call({
 int? id, Title? title, CoverImage? coverImage, dynamic chapters, dynamic volumes, int? averageScore
});


$TitleCopyWith<$Res>? get title;$CoverImageCopyWith<$Res>? get coverImage;

}
/// @nodoc
class _$MediaCopyWithImpl<$Res>
    implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._self, this._then);

  final Media _self;
  final $Res Function(Media) _then;

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? coverImage = freezed,Object? chapters = freezed,Object? volumes = freezed,Object? averageScore = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Title?,coverImage: freezed == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as CoverImage?,chapters: freezed == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as dynamic,volumes: freezed == volumes ? _self.volumes : volumes // ignore: cast_nullable_to_non_nullable
as dynamic,averageScore: freezed == averageScore ? _self.averageScore : averageScore // ignore: cast_nullable_to_non_nullable
as int?,
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
return $default(_that);}
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  Title? title,  CoverImage? coverImage,  dynamic chapters,  dynamic volumes,  int? averageScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Media() when $default != null:
return $default(_that.id,_that.title,_that.coverImage,_that.chapters,_that.volumes,_that.averageScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  Title? title,  CoverImage? coverImage,  dynamic chapters,  dynamic volumes,  int? averageScore)  $default,) {final _that = this;
switch (_that) {
case _Media():
return $default(_that.id,_that.title,_that.coverImage,_that.chapters,_that.volumes,_that.averageScore);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  Title? title,  CoverImage? coverImage,  dynamic chapters,  dynamic volumes,  int? averageScore)?  $default,) {final _that = this;
switch (_that) {
case _Media() when $default != null:
return $default(_that.id,_that.title,_that.coverImage,_that.chapters,_that.volumes,_that.averageScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Media implements Media {
  const _Media({this.id, this.title, this.coverImage, this.chapters, this.volumes, this.averageScore});
  factory _Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

@override final  int? id;
@override final  Title? title;
@override final  CoverImage? coverImage;
@override final  dynamic chapters;
@override final  dynamic volumes;
@override final  int? averageScore;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Media&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage)&&const DeepCollectionEquality().equals(other.chapters, chapters)&&const DeepCollectionEquality().equals(other.volumes, volumes)&&(identical(other.averageScore, averageScore) || other.averageScore == averageScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,coverImage,const DeepCollectionEquality().hash(chapters),const DeepCollectionEquality().hash(volumes),averageScore);

@override
String toString() {
  return 'Media(id: $id, title: $title, coverImage: $coverImage, chapters: $chapters, volumes: $volumes, averageScore: $averageScore)';
}


}

/// @nodoc
abstract mixin class _$MediaCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory _$MediaCopyWith(_Media value, $Res Function(_Media) _then) = __$MediaCopyWithImpl;
@override @useResult
$Res call({
 int? id, Title? title, CoverImage? coverImage, dynamic chapters, dynamic volumes, int? averageScore
});


@override $TitleCopyWith<$Res>? get title;@override $CoverImageCopyWith<$Res>? get coverImage;

}
/// @nodoc
class __$MediaCopyWithImpl<$Res>
    implements _$MediaCopyWith<$Res> {
  __$MediaCopyWithImpl(this._self, this._then);

  final _Media _self;
  final $Res Function(_Media) _then;

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? coverImage = freezed,Object? chapters = freezed,Object? volumes = freezed,Object? averageScore = freezed,}) {
  return _then(_Media(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Title?,coverImage: freezed == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as CoverImage?,chapters: freezed == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as dynamic,volumes: freezed == volumes ? _self.volumes : volumes // ignore: cast_nullable_to_non_nullable
as dynamic,averageScore: freezed == averageScore ? _self.averageScore : averageScore // ignore: cast_nullable_to_non_nullable
as int?,
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
}
}

// dart format on
