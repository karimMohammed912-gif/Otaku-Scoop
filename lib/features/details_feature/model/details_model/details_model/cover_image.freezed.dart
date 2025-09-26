// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cover_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoverImage {

 String? get large;
/// Create a copy of CoverImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoverImageCopyWith<CoverImage> get copyWith => _$CoverImageCopyWithImpl<CoverImage>(this as CoverImage, _$identity);

  /// Serializes this CoverImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoverImage&&(identical(other.large, large) || other.large == large));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,large);

@override
String toString() {
  return 'CoverImage(large: $large)';
}


}

/// @nodoc
abstract mixin class $CoverImageCopyWith<$Res>  {
  factory $CoverImageCopyWith(CoverImage value, $Res Function(CoverImage) _then) = _$CoverImageCopyWithImpl;
@useResult
$Res call({
 String? large
});




}
/// @nodoc
class _$CoverImageCopyWithImpl<$Res>
    implements $CoverImageCopyWith<$Res> {
  _$CoverImageCopyWithImpl(this._self, this._then);

  final CoverImage _self;
  final $Res Function(CoverImage) _then;

/// Create a copy of CoverImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? large = freezed,}) {
  return _then(_self.copyWith(
large: freezed == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CoverImage].
extension CoverImagePatterns on CoverImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoverImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoverImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoverImage value)  $default,){
final _that = this;
switch (_that) {
case _CoverImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoverImage value)?  $default,){
final _that = this;
switch (_that) {
case _CoverImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? large)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoverImage() when $default != null:
return $default(_that.large);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? large)  $default,) {final _that = this;
switch (_that) {
case _CoverImage():
return $default(_that.large);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? large)?  $default,) {final _that = this;
switch (_that) {
case _CoverImage() when $default != null:
return $default(_that.large);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoverImage implements CoverImage {
   _CoverImage({this.large});
  factory _CoverImage.fromJson(Map<String, dynamic> json) => _$CoverImageFromJson(json);

@override final  String? large;

/// Create a copy of CoverImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoverImageCopyWith<_CoverImage> get copyWith => __$CoverImageCopyWithImpl<_CoverImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoverImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoverImage&&(identical(other.large, large) || other.large == large));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,large);

@override
String toString() {
  return 'CoverImage(large: $large)';
}


}

/// @nodoc
abstract mixin class _$CoverImageCopyWith<$Res> implements $CoverImageCopyWith<$Res> {
  factory _$CoverImageCopyWith(_CoverImage value, $Res Function(_CoverImage) _then) = __$CoverImageCopyWithImpl;
@override @useResult
$Res call({
 String? large
});




}
/// @nodoc
class __$CoverImageCopyWithImpl<$Res>
    implements _$CoverImageCopyWith<$Res> {
  __$CoverImageCopyWithImpl(this._self, this._then);

  final _CoverImage _self;
  final $Res Function(_CoverImage) _then;

/// Create a copy of CoverImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? large = freezed,}) {
  return _then(_CoverImage(
large: freezed == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
