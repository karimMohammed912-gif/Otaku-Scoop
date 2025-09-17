// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Node {

 Name? get name; Image? get image;
/// Create a copy of Node
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NodeCopyWith<Node> get copyWith => _$NodeCopyWithImpl<Node>(this as Node, _$identity);

  /// Serializes this Node to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Node&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,image);

@override
String toString() {
  return 'Node(name: $name, image: $image)';
}


}

/// @nodoc
abstract mixin class $NodeCopyWith<$Res>  {
  factory $NodeCopyWith(Node value, $Res Function(Node) _then) = _$NodeCopyWithImpl;
@useResult
$Res call({
 Name? name, Image? image
});


$NameCopyWith<$Res>? get name;$ImageCopyWith<$Res>? get image;

}
/// @nodoc
class _$NodeCopyWithImpl<$Res>
    implements $NodeCopyWith<$Res> {
  _$NodeCopyWithImpl(this._self, this._then);

  final Node _self;
  final $Res Function(Node) _then;

/// Create a copy of Node
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? image = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Name?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Image?,
  ));
}
/// Create a copy of Node
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NameCopyWith<$Res>? get name {
    if (_self.name == null) {
    return null;
  }

  return $NameCopyWith<$Res>(_self.name!, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of Node
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $ImageCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}


/// Adds pattern-matching-related methods to [Node].
extension NodePatterns on Node {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Node value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Node() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Node value)  $default,){
final _that = this;
switch (_that) {
case _Node():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Node value)?  $default,){
final _that = this;
switch (_that) {
case _Node() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Name? name,  Image? image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Node() when $default != null:
return $default(_that.name,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Name? name,  Image? image)  $default,) {final _that = this;
switch (_that) {
case _Node():
return $default(_that.name,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Name? name,  Image? image)?  $default,) {final _that = this;
switch (_that) {
case _Node() when $default != null:
return $default(_that.name,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Node implements Node {
   _Node({this.name, this.image});
  factory _Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);

@override final  Name? name;
@override final  Image? image;

/// Create a copy of Node
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NodeCopyWith<_Node> get copyWith => __$NodeCopyWithImpl<_Node>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Node&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,image);

@override
String toString() {
  return 'Node(name: $name, image: $image)';
}


}

/// @nodoc
abstract mixin class _$NodeCopyWith<$Res> implements $NodeCopyWith<$Res> {
  factory _$NodeCopyWith(_Node value, $Res Function(_Node) _then) = __$NodeCopyWithImpl;
@override @useResult
$Res call({
 Name? name, Image? image
});


@override $NameCopyWith<$Res>? get name;@override $ImageCopyWith<$Res>? get image;

}
/// @nodoc
class __$NodeCopyWithImpl<$Res>
    implements _$NodeCopyWith<$Res> {
  __$NodeCopyWithImpl(this._self, this._then);

  final _Node _self;
  final $Res Function(_Node) _then;

/// Create a copy of Node
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? image = freezed,}) {
  return _then(_Node(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Name?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Image?,
  ));
}

/// Create a copy of Node
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NameCopyWith<$Res>? get name {
    if (_self.name == null) {
    return null;
  }

  return $NameCopyWith<$Res>(_self.name!, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of Node
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $ImageCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}

// dart format on
