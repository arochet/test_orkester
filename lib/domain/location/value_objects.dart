import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
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

/// Type de compte (email, google, échec)
enum TypeWeatherState { sun, thinning, rain, fail }

extension ParseToSringTA on TypeWeatherState {
  String toShortString() {
    return this.toString().toLowerCase();
  }

  String toDisplayString() {
    return this.toString().substring(17);
  }

  IconData toIcon() {
    switch (this) {
      case TypeWeatherState.sun:
        return Icons.sunny;
      case TypeWeatherState.thinning:
        return Icons.wb_cloudy;
      case TypeWeatherState.rain:
        return Icons.cloud;
      case TypeWeatherState.fail:
        return Icons.error;
    }
  }
}

/// Type de compte (email, google, échec)<br>
/// Type avec TypeAccountState
@immutable
class TypeWeather extends ValueObject<TypeWeatherState> {
  @override
  final Either<ValueFailure<TypeWeatherState>, TypeWeatherState> value;

  factory TypeWeather(TypeWeatherState input) {
    return TypeWeather._(right(input));
  }

  factory TypeWeather.fromString(String input) {
    try {
      final TypeWeatherState? state = TypeWeatherState.values.firstWhere((e) {
        return e.toShortString() == input.toLowerCase();
      });
      if (state == null)
        return TypeWeather._(left(ValueFailure.invalidEnum(failedValue: TypeWeatherState.fail)));
      return TypeWeather._(right(state));
    } catch (e) {
      return TypeWeather._(left(ValueFailure.invalidEnum(failedValue: TypeWeatherState.fail)));
    }
  }

  const TypeWeather._(this.value);
}

/// Température en degrés celcius
@immutable
class Temperature extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory Temperature(double coordinate) {
    return Temperature._(validateCoordinate(coordinate));
  }
  const Temperature._(this.value);
}
