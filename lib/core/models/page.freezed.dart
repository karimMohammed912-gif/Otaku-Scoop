// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Page {

 PageInfo? get pageInfo; List<Media>? get media;
/// Create a copy of Page
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageCopyWith<Page> get copyWith => _$PageCopyWithImpl<Page>(this as Page, _$identity);

  /// Serializes this Page to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Page&&(identical(other.pageInfo, pageInfo) || other.pageInfo == pageInfo)&&const DeepCollectionEquality().equals(other.media, media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pageInfo,const DeepCollectionEquality().hash(media));

@override
String toString() {
  return 'Page(pageInfo: $pageInfo, media: $media)';
}


}

/// @nodoc
abstract mixin class $PageCopyWith<$Res>  {
  factory $PageCopyWith(Page value, $Res Function(Page) _then) = _$PageCopyWithImpl;
@useResult
$Res call({
 PageInfo? pageInfo, List<Media>? media
});


$PageInfoCopyWith<$Res>? get pageInfo;

}
/// @nodoc
class _$PageCopyWithImpl<$Res>
    implements $PageCopyWith<$Res> {
  _$PageCopyWithImpl(this._self, this._then);

  final Page _self;
  final $Res Function(Page) _then;

/// Create a copy of Page
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageInfo = freezed,Object? media = freezed,}) {
  return _then(_self.copyWith(
pageInfo: freezed == pageInfo ? _self.pageInfo : pageInfo // ignore: cast_nullable_to_non_nullable
as PageInfo?,media: freezed == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as List<Media>?,
  ));
}
/// Create a copy of Page
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageInfoCopyWith<$Res>? get pageInfo {
    if (_self.pageInfo == null) {
    return null;
  }

  return $PageInfoCopyWith<$Res>(_self.pageInfo!, (value) {
    return _then(_self.copyWith(pageInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [Page].
extension PagePatterns on Page {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Page value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Page() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Page value)  $default,){
final _that = this;
switch (_that) {
case _Page():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Page value)?  $default,){
final _that = this;
switch (_that) {
case _Page() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageInfo? pageInfo,  List<Media>? media)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Page() when $default != null:
return $default(_that.pageInfo,_that.media);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageInfo? pageInfo,  List<Media>? media)  $default,) {final _that = this;
switch (_that) {
case _Page():
return $default(_that.pageInfo,_that.media);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageInfo? pageInfo,  List<Media>? media)?  $default,) {final _that = this;
switch (_that) {
case _Page() when $default != null:
return $default(_that.pageInfo,_that.media);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Page implements Page {
  const _Page({this.pageInfo, final  List<Media>? media}): _media = media;
  factory _Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

@override final  PageInfo? pageInfo;
 final  List<Media>? _media;
@override List<Media>? get media {
  final value = _media;
  if (value == null) return null;
  if (_media is EqualUnmodifiableListView) return _media;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Page
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageCopyWith<_Page> get copyWith => __$PageCopyWithImpl<_Page>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Page&&(identical(other.pageInfo, pageInfo) || other.pageInfo == pageInfo)&&const DeepCollectionEquality().equals(other._media, _media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pageInfo,const DeepCollectionEquality().hash(_media));

@override
String toString() {
  return 'Page(pageInfo: $pageInfo, media: $media)';
}


}

/// @nodoc
abstract mixin class _$PageCopyWith<$Res> implements $PageCopyWith<$Res> {
  factory _$PageCopyWith(_Page value, $Res Function(_Page) _then) = __$PageCopyWithImpl;
@override @useResult
$Res call({
 PageInfo? pageInfo, List<Media>? media
});


@override $PageInfoCopyWith<$Res>? get pageInfo;

}
/// @nodoc
class __$PageCopyWithImpl<$Res>
    implements _$PageCopyWith<$Res> {
  __$PageCopyWithImpl(this._self, this._then);

  final _Page _self;
  final $Res Function(_Page) _then;

/// Create a copy of Page
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageInfo = freezed,Object? media = freezed,}) {
  return _then(_Page(
pageInfo: freezed == pageInfo ? _self.pageInfo : pageInfo // ignore: cast_nullable_to_non_nullable
as PageInfo?,media: freezed == media ? _self._media : media // ignore: cast_nullable_to_non_nullable
as List<Media>?,
  ));
}

/// Create a copy of Page
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageInfoCopyWith<$Res>? get pageInfo {
    if (_self.pageInfo == null) {
    return null;
  }

  return $PageInfoCopyWith<$Res>(_self.pageInfo!, (value) {
    return _then(_self.copyWith(pageInfo: value));
  });
}
}

// dart format on
