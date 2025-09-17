// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Edge {

 Node? get node;
/// Create a copy of Edge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EdgeCopyWith<Edge> get copyWith => _$EdgeCopyWithImpl<Edge>(this as Edge, _$identity);

  /// Serializes this Edge to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Edge&&(identical(other.node, node) || other.node == node));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,node);

@override
String toString() {
  return 'Edge(node: $node)';
}


}

/// @nodoc
abstract mixin class $EdgeCopyWith<$Res>  {
  factory $EdgeCopyWith(Edge value, $Res Function(Edge) _then) = _$EdgeCopyWithImpl;
@useResult
$Res call({
 Node? node
});


$NodeCopyWith<$Res>? get node;

}
/// @nodoc
class _$EdgeCopyWithImpl<$Res>
    implements $EdgeCopyWith<$Res> {
  _$EdgeCopyWithImpl(this._self, this._then);

  final Edge _self;
  final $Res Function(Edge) _then;

/// Create a copy of Edge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? node = freezed,}) {
  return _then(_self.copyWith(
node: freezed == node ? _self.node : node // ignore: cast_nullable_to_non_nullable
as Node?,
  ));
}
/// Create a copy of Edge
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodeCopyWith<$Res>? get node {
    if (_self.node == null) {
    return null;
  }

  return $NodeCopyWith<$Res>(_self.node!, (value) {
    return _then(_self.copyWith(node: value));
  });
}
}


/// Adds pattern-matching-related methods to [Edge].
extension EdgePatterns on Edge {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Edge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Edge() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Edge value)  $default,){
final _that = this;
switch (_that) {
case _Edge():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Edge value)?  $default,){
final _that = this;
switch (_that) {
case _Edge() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Node? node)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Edge() when $default != null:
return $default(_that.node);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Node? node)  $default,) {final _that = this;
switch (_that) {
case _Edge():
return $default(_that.node);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Node? node)?  $default,) {final _that = this;
switch (_that) {
case _Edge() when $default != null:
return $default(_that.node);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Edge implements Edge {
   _Edge({this.node});
  factory _Edge.fromJson(Map<String, dynamic> json) => _$EdgeFromJson(json);

@override final  Node? node;

/// Create a copy of Edge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EdgeCopyWith<_Edge> get copyWith => __$EdgeCopyWithImpl<_Edge>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EdgeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Edge&&(identical(other.node, node) || other.node == node));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,node);

@override
String toString() {
  return 'Edge(node: $node)';
}


}

/// @nodoc
abstract mixin class _$EdgeCopyWith<$Res> implements $EdgeCopyWith<$Res> {
  factory _$EdgeCopyWith(_Edge value, $Res Function(_Edge) _then) = __$EdgeCopyWithImpl;
@override @useResult
$Res call({
 Node? node
});


@override $NodeCopyWith<$Res>? get node;

}
/// @nodoc
class __$EdgeCopyWithImpl<$Res>
    implements _$EdgeCopyWith<$Res> {
  __$EdgeCopyWithImpl(this._self, this._then);

  final _Edge _self;
  final $Res Function(_Edge) _then;

/// Create a copy of Edge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? node = freezed,}) {
  return _then(_Edge(
node: freezed == node ? _self.node : node // ignore: cast_nullable_to_non_nullable
as Node?,
  ));
}

/// Create a copy of Edge
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NodeCopyWith<$Res>? get node {
    if (_self.node == null) {
    return null;
  }

  return $NodeCopyWith<$Res>(_self.node!, (value) {
    return _then(_self.copyWith(node: value));
  });
}
}

// dart format on
