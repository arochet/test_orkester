// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_weatherdata_form_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddWeatherDataFormData {
  WeatherData get weatherData => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<WeatherDataFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddWeatherDataFormDataCopyWith<AddWeatherDataFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddWeatherDataFormDataCopyWith<$Res> {
  factory $AddWeatherDataFormDataCopyWith(AddWeatherDataFormData value,
          $Res Function(AddWeatherDataFormData) then) =
      _$AddWeatherDataFormDataCopyWithImpl<$Res, AddWeatherDataFormData>;
  @useResult
  $Res call(
      {WeatherData weatherData,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<WeatherDataFailure, Unit>> authFailureOrSuccessOption});

  $WeatherDataCopyWith<$Res> get weatherData;
}

/// @nodoc
class _$AddWeatherDataFormDataCopyWithImpl<$Res,
        $Val extends AddWeatherDataFormData>
    implements $AddWeatherDataFormDataCopyWith<$Res> {
  _$AddWeatherDataFormDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherData = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      weatherData: null == weatherData
          ? _value.weatherData
          : weatherData // ignore: cast_nullable_to_non_nullable
              as WeatherData,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<WeatherDataFailure, Unit>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherDataCopyWith<$Res> get weatherData {
    return $WeatherDataCopyWith<$Res>(_value.weatherData, (value) {
      return _then(_value.copyWith(weatherData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddWeatherDataFormDataCopyWith<$Res>
    implements $AddWeatherDataFormDataCopyWith<$Res> {
  factory _$$_AddWeatherDataFormDataCopyWith(_$_AddWeatherDataFormData value,
          $Res Function(_$_AddWeatherDataFormData) then) =
      __$$_AddWeatherDataFormDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WeatherData weatherData,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<WeatherDataFailure, Unit>> authFailureOrSuccessOption});

  @override
  $WeatherDataCopyWith<$Res> get weatherData;
}

/// @nodoc
class __$$_AddWeatherDataFormDataCopyWithImpl<$Res>
    extends _$AddWeatherDataFormDataCopyWithImpl<$Res,
        _$_AddWeatherDataFormData>
    implements _$$_AddWeatherDataFormDataCopyWith<$Res> {
  __$$_AddWeatherDataFormDataCopyWithImpl(_$_AddWeatherDataFormData _value,
      $Res Function(_$_AddWeatherDataFormData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherData = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_$_AddWeatherDataFormData(
      weatherData: null == weatherData
          ? _value.weatherData
          : weatherData // ignore: cast_nullable_to_non_nullable
              as WeatherData,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<WeatherDataFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_AddWeatherDataFormData implements _AddWeatherDataFormData {
  const _$_AddWeatherDataFormData(
      {required this.weatherData,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

  @override
  final WeatherData weatherData;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<WeatherDataFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'AddWeatherDataFormData(weatherData: $weatherData, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddWeatherDataFormData &&
            (identical(other.weatherData, weatherData) ||
                other.weatherData == weatherData) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                other.authFailureOrSuccessOption ==
                    authFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weatherData, showErrorMessages,
      isSubmitting, authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddWeatherDataFormDataCopyWith<_$_AddWeatherDataFormData> get copyWith =>
      __$$_AddWeatherDataFormDataCopyWithImpl<_$_AddWeatherDataFormData>(
          this, _$identity);
}

abstract class _AddWeatherDataFormData implements AddWeatherDataFormData {
  const factory _AddWeatherDataFormData(
      {required final WeatherData weatherData,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<WeatherDataFailure, Unit>>
          authFailureOrSuccessOption}) = _$_AddWeatherDataFormData;

  @override
  WeatherData get weatherData;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<WeatherDataFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_AddWeatherDataFormDataCopyWith<_$_AddWeatherDataFormData> get copyWith =>
      throw _privateConstructorUsedError;
}
