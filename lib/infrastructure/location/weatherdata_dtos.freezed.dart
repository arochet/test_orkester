// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weatherdata_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherDataDTO _$WeatherDataDTOFromJson(Map<String, dynamic> json) {
  return _WeatherDataDTO.fromJson(json);
}

/// @nodoc
mixin _$WeatherDataDTO {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  int get date => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherDataDTOCopyWith<WeatherDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDataDTOCopyWith<$Res> {
  factory $WeatherDataDTOCopyWith(
          WeatherDataDTO value, $Res Function(WeatherDataDTO) then) =
      _$WeatherDataDTOCopyWithImpl<$Res, WeatherDataDTO>;
  @useResult
  $Res call({@JsonKey(ignore: true) String? id, int date, String type});
}

/// @nodoc
class _$WeatherDataDTOCopyWithImpl<$Res, $Val extends WeatherDataDTO>
    implements $WeatherDataDTOCopyWith<$Res> {
  _$WeatherDataDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeatherDataDTOCopyWith<$Res>
    implements $WeatherDataDTOCopyWith<$Res> {
  factory _$$_WeatherDataDTOCopyWith(
          _$_WeatherDataDTO value, $Res Function(_$_WeatherDataDTO) then) =
      __$$_WeatherDataDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(ignore: true) String? id, int date, String type});
}

/// @nodoc
class __$$_WeatherDataDTOCopyWithImpl<$Res>
    extends _$WeatherDataDTOCopyWithImpl<$Res, _$_WeatherDataDTO>
    implements _$$_WeatherDataDTOCopyWith<$Res> {
  __$$_WeatherDataDTOCopyWithImpl(
      _$_WeatherDataDTO _value, $Res Function(_$_WeatherDataDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = null,
    Object? type = null,
  }) {
    return _then(_$_WeatherDataDTO(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherDataDTO extends _WeatherDataDTO {
  const _$_WeatherDataDTO(
      {@JsonKey(ignore: true) this.id, required this.date, required this.type})
      : super._();

  factory _$_WeatherDataDTO.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherDataDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final int date;
  @override
  final String type;

  @override
  String toString() {
    return 'WeatherDataDTO(id: $id, date: $date, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherDataDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherDataDTOCopyWith<_$_WeatherDataDTO> get copyWith =>
      __$$_WeatherDataDTOCopyWithImpl<_$_WeatherDataDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherDataDTOToJson(
      this,
    );
  }
}

abstract class _WeatherDataDTO extends WeatherDataDTO {
  const factory _WeatherDataDTO(
      {@JsonKey(ignore: true) final String? id,
      required final int date,
      required final String type}) = _$_WeatherDataDTO;
  const _WeatherDataDTO._() : super._();

  factory _WeatherDataDTO.fromJson(Map<String, dynamic> json) =
      _$_WeatherDataDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  int get date;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherDataDTOCopyWith<_$_WeatherDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
