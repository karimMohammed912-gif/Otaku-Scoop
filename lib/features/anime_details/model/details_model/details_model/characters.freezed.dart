// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'characters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Characters {

 List<Edge>? get edges;
/// Create a copy of Characters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharactersCopyWith<Characters> get copyWith => _$CharactersCopyWithImpl<Characters>(this as Characters, _$identity);

  /// Serializes this Characters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Characters&&const DeepCollectionEquality().equals(other.edges, edges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(edges));

@override
String toString() {
  return 'Characters(edges: $edges)';
}


}

/// @nodoc
abstract mixin class $CharactersCopyWith<$Res>  {
  factory $CharactersCopyWith(Characters value, $Res Function(Characters) _then) = _$CharactersCopyWithImpl;
@useResult
$Res call({
 List<Edge>? edges
});




}
/// @nodoc
class _$CharactersCopyWithImpl<$Res>
    implements $CharactersCopyWith<$Res> {
  _$CharactersCopyWithImpl(this._self, this._then);

  final Characters _self;
  final $Res Function(Characters) _then;

/// Create a copy of Characters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? edges = freezed,}) {
  return _then(_self.copyWith(
edges: freezed == edges ? _self.edges : edges // ignore: cast_nullable_to_non_nullable
as List<Edge>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Characters].
extension CharactersPatterns on Characters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Characters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Characters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Characters value)  $default,){
final _that = this;
switch (_that) {
case _Characters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Characters value)?  $default,){
final _that = this;
switch (_that) {
case _Characters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Edge>? edges)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Characters() when $default != null:
return $default(_that.edges);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Edge>? edges)  $default,) {final _that = this;
switch (_that) {
case _Characters():
return $default(_that.edges);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Edge>? edges)?  $default,) {final _that = this;
switch (_that) {
case _Characters() when $default != null:
return $default(_that.edges);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Characters implements Characters {
   _Characters({final  List<Edge>? edges}): _edges = edges;
  factory _Characters.fromJson(Map<String, dynamic> json) => _$CharactersFromJson(json);

 final  List<Edge>? _edges;
@override List<Edge>? get edges {
  final value = _edges;
  if (value == null) return null;
  if (_edges is EqualUnmodifiableListView) return _edges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Characters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharactersCopyWith<_Characters> get copyWith => __$CharactersCopyWithImpl<_Characters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CharactersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Characters&&const DeepCollectionEquality().equals(other._edges, _edges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_edges));

@override
String toString() {
  return 'Characters(edges: $edges)';
}


}

/// @nodoc
abstract mixin class _$CharactersCopyWith<$Res> implements $CharactersCopyWith<$Res> {
  factory _$CharactersCopyWith(_Characters value, $Res Function(_Characters) _then) = __$CharactersCopyWithImpl;
@override @useResult
$Res call({
 List<Edge>? edges
});




}
/// @nodoc
class __$CharactersCopyWithImpl<$Res>
    implements _$CharactersCopyWith<$Res> {
  __$CharactersCopyWithImpl(this._self, this._then);

  final _Characters _self;
  final $Res Function(_Characters) _then;

/// Create a copy of Characters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? edges = freezed,}) {
  return _then(_Characters(
edges: freezed == edges ? _self._edges : edges // ignore: cast_nullable_to_non_nullable
as List<Edge>?,
  ));
}


}

// dart format on
