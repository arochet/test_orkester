// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocationDTO _$LocationDTOFromJson(Map<String, dynamic> json) {
  return _LocationDTO.fromJson(json);
}

/// @nodoc
mixin _$LocationDTO {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get place => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationDTOCopyWith<LocationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDTOCopyWith<$Res> {
  factory $LocationDTOCopyWith(
          LocationDTO value, $Res Function(LocationDTO) then) =
      _$LocationDTOCopyWithImpl<$Res, LocationDTO>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      double latitude,
      double longitude,
      String place});
}

/// @nodoc
class _$LocationDTOCopyWithImpl<$Res, $Val extends LocationDTO>
    implements $LocationDTOCopyWith<$Res> {
  _$LocationDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? place = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocationDTOCopyWith<$Res>
    implements $LocationDTOCopyWith<$Res> {
  factory _$$_LocationDTOCopyWith(
          _$_LocationDTO value, $Res Function(_$_LocationDTO) then) =
      __$$_LocationDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      double latitude,
      double longitude,
      String place});
}

/// @nodoc
class __$$_LocationDTOCopyWithImpl<$Res>
    extends _$LocationDTOCopyWithImpl<$Res, _$_LocationDTO>
    implements _$$_LocationDTOCopyWith<$Res> {
  __$$_LocationDTOCopyWithImpl(
      _$_LocationDTO _value, $Res Function(_$_LocationDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? place = null,
  }) {
    return _then(_$_LocationDTO(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocationDTO extends _LocationDTO {
  const _$_LocationDTO(
      {@JsonKey(ignore: true) this.id,
      required this.latitude,
      required this.longitude,
      required this.place})
      : super._();

  factory _$_LocationDTO.fromJson(Map<String, dynamic> json) =>
      _$$_LocationDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String place;

  @override
  String toString() {
    return 'LocationDTO(id: $id, latitude: $latitude, longitude: $longitude, place: $place)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.place, place) || other.place == place));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, latitude, longitude, place);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationDTOCopyWith<_$_LocationDTO> get copyWith =>
      __$$_LocationDTOCopyWithImpl<_$_LocationDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationDTOToJson(
      this,
    );
  }
}

abstract class _LocationDTO extends LocationDTO {
  const factory _LocationDTO(
      {@JsonKey(ignore: true) final String? id,
      required final double latitude,
      required final double longitude,
      required final String place}) = _$_LocationDTO;
  const _LocationDTO._() : super._();

  factory _LocationDTO.fromJson(Map<String, dynamic> json) =
      _$_LocationDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get place;
  @override
  @JsonKey(ignore: true)
  _$$_LocationDTOCopyWith<_$_LocationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
