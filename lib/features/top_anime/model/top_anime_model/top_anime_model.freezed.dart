// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_anime_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopAnimeModel {

 Data? get data;
/// Create a copy of TopAnimeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopAnimeModelCopyWith<TopAnimeModel> get copyWith => _$TopAnimeModelCopyWithImpl<TopAnimeModel>(this as TopAnimeModel, _$identity);

  /// Serializes this TopAnimeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopAnimeModel&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'TopAnimeModel(data: $data)';
}


}

/// @nodoc
abstract mixin class $TopAnimeModelCopyWith<$Res>  {
  factory $TopAnimeModelCopyWith(TopAnimeModel value, $Res Function(TopAnimeModel) _then) = _$TopAnimeModelCopyWithImpl;
@useResult
$Res call({
 Data? data
});


$DataCopyWith<$Res>? get data;

}
/// @nodoc
class _$TopAnimeModelCopyWithImpl<$Res>
    implements $TopAnimeModelCopyWith<$Res> {
  _$TopAnimeModelCopyWithImpl(this._self, this._then);

  final TopAnimeModel _self;
  final $Res Function(TopAnimeModel) _then;

/// Create a copy of TopAnimeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Data?,
  ));
}
/// Create a copy of TopAnimeModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [TopAnimeModel].
extension TopAnimeModelPatterns on TopAnimeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopAnimeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopAnimeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopAnimeModel value)  $default,){
final _that = this;
switch (_that) {
case _TopAnimeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopAnimeModel value)?  $default,){
final _that = this;
switch (_that) {
case _TopAnimeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Data? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopAnimeModel() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Data? data)  $default,) {final _that = this;
switch (_that) {
case _TopAnimeModel():
return $default(_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Data? data)?  $default,) {final _that = this;
switch (_that) {
case _TopAnimeModel() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopAnimeModel implements TopAnimeModel {
  const _TopAnimeModel({this.data});
  factory _TopAnimeModel.fromJson(Map<String, dynamic> json) => _$TopAnimeModelFromJson(json);

@override final  Data? data;

/// Create a copy of TopAnimeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopAnimeModelCopyWith<_TopAnimeModel> get copyWith => __$TopAnimeModelCopyWithImpl<_TopAnimeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopAnimeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopAnimeModel&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'TopAnimeModel(data: $data)';
}


}

/// @nodoc
abstract mixin class _$TopAnimeModelCopyWith<$Res> implements $TopAnimeModelCopyWith<$Res> {
  factory _$TopAnimeModelCopyWith(_TopAnimeModel value, $Res Function(_TopAnimeModel) _then) = __$TopAnimeModelCopyWithImpl;
@override @useResult
$Res call({
 Data? data
});


@override $DataCopyWith<$Res>? get data;

}
/// @nodoc
class __$TopAnimeModelCopyWithImpl<$Res>
    implements _$TopAnimeModelCopyWith<$Res> {
  __$TopAnimeModelCopyWithImpl(this._self, this._then);

  final _TopAnimeModel _self;
  final $Res Function(_TopAnimeModel) _then;

/// Create a copy of TopAnimeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_TopAnimeModel(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Data?,
  ));
}

/// Create a copy of TopAnimeModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
