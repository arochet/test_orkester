import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meteo_okester/DOMAIN/core/value_objects.dart';
import 'package:meteo_okester/DOMAIN/auth/value_objects.dart';
import 'package:meteo_okester/DOMAIN/location/value_objects.dart';

part 'location.freezed.dart';

/// Coordonnée géographique avec le nom d'un lieu
@freezed
abstract class Location with _$Location {
  const Location._();

  const factory Location({
    required UniqueId id,
    required Coordinate latitude,
    required Coordinate longitude,
    required Nom place,
  }) = _Location;

  factory Location.empty() => Location(
        id: UniqueId(),
        latitude: Coordinate(0),
        longitude: Coordinate(0),
        place: Nom(''),
      );
}
