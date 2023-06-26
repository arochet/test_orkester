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

AppLocationDTO _$AppLocationDTOFromJson(Map<String, dynamic> json) {
  return _AppLocationDTO.fromJson(json);
}

/// @nodoc
mixin _$AppLocationDTO {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get place => throw _privateConstructorUsedError;
  String get listWeatherData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppLocationDTOCopyWith<AppLocationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLocationDTOCopyWith<$Res> {
  factory $AppLocationDTOCopyWith(
          AppLocationDTO value, $Res Function(AppLocationDTO) then) =
      _$AppLocationDTOCopyWithImpl<$Res, AppLocationDTO>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      double latitude,
      double longitude,
      String place,
      String listWeatherData});
}

/// @nodoc
class _$AppLocationDTOCopyWithImpl<$Res, $Val extends AppLocationDTO>
    implements $AppLocationDTOCopyWith<$Res> {
  _$AppLocationDTOCopyWithImpl(this._value, this._then);

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
    Object? listWeatherData = null,
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
      listWeatherData: null == listWeatherData
          ? _value.listWeatherData
          : listWeatherData // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppLocationDTOCopyWith<$Res>
    implements $AppLocationDTOCopyWith<$Res> {
  factory _$$_AppLocationDTOCopyWith(
          _$_AppLocationDTO value, $Res Function(_$_AppLocationDTO) then) =
      __$$_AppLocationDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      double latitude,
      double longitude,
      String place,
      String listWeatherData});
}

/// @nodoc
class __$$_AppLocationDTOCopyWithImpl<$Res>
    extends _$AppLocationDTOCopyWithImpl<$Res, _$_AppLocationDTO>
    implements _$$_AppLocationDTOCopyWith<$Res> {
  __$$_AppLocationDTOCopyWithImpl(
      _$_AppLocationDTO _value, $Res Function(_$_AppLocationDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? place = null,
    Object? listWeatherData = null,
  }) {
    return _then(_$_AppLocationDTO(
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
      listWeatherData: null == listWeatherData
          ? _value.listWeatherData
          : listWeatherData // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppLocationDTO extends _AppLocationDTO {
  const _$_AppLocationDTO(
      {@JsonKey(ignore: true) this.id,
      required this.latitude,
      required this.longitude,
      required this.place,
      required this.listWeatherData})
      : super._();

  factory _$_AppLocationDTO.fromJson(Map<String, dynamic> json) =>
      _$$_AppLocationDTOFromJson(json);

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
  final String listWeatherData;

  @override
  String toString() {
    return 'AppLocationDTO(id: $id, latitude: $latitude, longitude: $longitude, place: $place, listWeatherData: $listWeatherData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppLocationDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.listWeatherData, listWeatherData) ||
                other.listWeatherData == listWeatherData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, latitude, longitude, place, listWeatherData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppLocationDTOCopyWith<_$_AppLocationDTO> get copyWith =>
      __$$_AppLocationDTOCopyWithImpl<_$_AppLocationDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppLocationDTOToJson(
      this,
    );
  }
}

abstract class _AppLocationDTO extends AppLocationDTO {
  const factory _AppLocationDTO(
      {@JsonKey(ignore: true) final String? id,
      required final double latitude,
      required final double longitude,
      required final String place,
      required final String listWeatherData}) = _$_AppLocationDTO;
  const _AppLocationDTO._() : super._();

  factory _AppLocationDTO.fromJson(Map<String, dynamic> json) =
      _$_AppLocationDTO.fromJson;

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
  String get listWeatherData;
  @override
  @JsonKey(ignore: true)
  _$$_AppLocationDTOCopyWith<_$_AppLocationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
