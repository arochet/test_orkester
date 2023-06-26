// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppLocation {
  UniqueId get id => throw _privateConstructorUsedError;
  Coordinate get latitude => throw _privateConstructorUsedError;
  Coordinate get longitude => throw _privateConstructorUsedError;
  Nom get place => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppLocationCopyWith<AppLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLocationCopyWith<$Res> {
  factory $AppLocationCopyWith(
          AppLocation value, $Res Function(AppLocation) then) =
      _$AppLocationCopyWithImpl<$Res, AppLocation>;
  @useResult
  $Res call(
      {UniqueId id, Coordinate latitude, Coordinate longitude, Nom place});
}

/// @nodoc
class _$AppLocationCopyWithImpl<$Res, $Val extends AppLocation>
    implements $AppLocationCopyWith<$Res> {
  _$AppLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? place = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as Coordinate,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as Coordinate,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as Nom,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppLocationCopyWith<$Res>
    implements $AppLocationCopyWith<$Res> {
  factory _$$_AppLocationCopyWith(
          _$_AppLocation value, $Res Function(_$_AppLocation) then) =
      __$$_AppLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id, Coordinate latitude, Coordinate longitude, Nom place});
}

/// @nodoc
class __$$_AppLocationCopyWithImpl<$Res>
    extends _$AppLocationCopyWithImpl<$Res, _$_AppLocation>
    implements _$$_AppLocationCopyWith<$Res> {
  __$$_AppLocationCopyWithImpl(
      _$_AppLocation _value, $Res Function(_$_AppLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? place = null,
  }) {
    return _then(_$_AppLocation(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as Coordinate,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as Coordinate,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as Nom,
    ));
  }
}

/// @nodoc

class _$_AppLocation extends _AppLocation {
  const _$_AppLocation(
      {required this.id,
      required this.latitude,
      required this.longitude,
      required this.place})
      : super._();

  @override
  final UniqueId id;
  @override
  final Coordinate latitude;
  @override
  final Coordinate longitude;
  @override
  final Nom place;

  @override
  String toString() {
    return 'AppLocation(id: $id, latitude: $latitude, longitude: $longitude, place: $place)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppLocation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.place, place) || other.place == place));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, latitude, longitude, place);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppLocationCopyWith<_$_AppLocation> get copyWith =>
      __$$_AppLocationCopyWithImpl<_$_AppLocation>(this, _$identity);
}

abstract class _AppLocation extends AppLocation {
  const factory _AppLocation(
      {required final UniqueId id,
      required final Coordinate latitude,
      required final Coordinate longitude,
      required final Nom place}) = _$_AppLocation;
  const _AppLocation._() : super._();

  @override
  UniqueId get id;
  @override
  Coordinate get latitude;
  @override
  Coordinate get longitude;
  @override
  Nom get place;
  @override
  @JsonKey(ignore: true)
  _$$_AppLocationCopyWith<_$_AppLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
