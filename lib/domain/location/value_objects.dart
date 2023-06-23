import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meteo_okester/DOMAIN/core/failures.dart';
import 'package:meteo_okester/DOMAIN/core/value_objects.dart';
import 'package:meteo_okester/DOMAIN/location/location_failure.dart';
import 'package:meteo_okester/DOMAIN/location/value_validators.dart';

/// Coordonnée géographique comme latitude ou longitude
@immutable
class Coordinate extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory Coordinate(double coordinate) {
    return Coordinate._(validateCoordinate(coordinate));
  }
  const Coordinate._(this.value);
}
