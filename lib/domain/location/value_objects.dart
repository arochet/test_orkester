import 'package:dartz/dartz.dart';
import 'package:meteo_okester/DOMAIN/core/failures.dart';
import 'package:meteo_okester/DOMAIN/core/value_objects.dart';
import 'package:meteo_okester/DOMAIN/location/value_validators.dart';

/// Coordonnée géographique comme latitude ou longitude
class Coordinate extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;
  factory Coordinate(double coordinate) {
    return Coordinate._(validateCoordinate(coordinate) as Either<ValueFailure<double>, double>);
  }
  const Coordinate._(this.value);
}
