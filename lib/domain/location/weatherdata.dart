import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meteo_okester/DOMAIN/core/value_objects.dart';
import 'package:meteo_okester/DOMAIN/auth/value_objects.dart';
import 'package:meteo_okester/DOMAIN/location/app_location.dart';
import 'package:meteo_okester/DOMAIN/location/value_objects.dart';

import 'value_objects.dart';

part 'weatherdata.freezed.dart';

/// Données météo que l'on stocke pour une date et un lieu
@freezed
abstract class WeatherData with _$WeatherData {
  const WeatherData._();

  const factory WeatherData({
    required UniqueId id,
    required DateTime date,
    required TypeWeather type,
  }) = _WeatherData;

  factory WeatherData.empty() => WeatherData(
        id: UniqueId(),
        date: DateTime.now(),
        type: TypeWeather(TypeWeatherState.sun),
      );
}