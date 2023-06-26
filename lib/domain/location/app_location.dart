import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meteo_okester/DOMAIN/core/value_objects.dart';
import 'package:meteo_okester/DOMAIN/auth/value_objects.dart';
import 'package:meteo_okester/DOMAIN/location/value_objects.dart';
import 'package:meteo_okester/DOMAIN/location/weatherdata.dart';

part 'app_location.freezed.dart';

/// Coordonnée géographique avec le nom d'un lieu
@freezed
abstract class AppLocation with _$AppLocation {
  const AppLocation._();

  const factory AppLocation({
    required UniqueId id,
    required Coordinate latitude,
    required Coordinate longitude,
    required Nom place,
    required List<WeatherData> listWeatherData,
  }) = _AppLocation;

  factory AppLocation.empty() => AppLocation(
        id: UniqueId(),
        latitude: Coordinate(0),
        longitude: Coordinate(0),
        place: Nom(''),
        listWeatherData: [],
      );

  factory AppLocation.id(UniqueId id) => AppLocation(
        id: id,
        latitude: Coordinate(0),
        longitude: Coordinate(0),
        place: Nom(''),
        listWeatherData: [],
      );
}
