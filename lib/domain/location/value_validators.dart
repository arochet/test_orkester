import 'package:dartz/dartz.dart';
import 'package:meteo_okester/DOMAIN/core/failures.dart';

import 'location_failure.dart';

/// Une coordonnée géographique est valide si elle est positive
Either<ValueFailure<double>, double> validateCoordinate(double coordinate) {
  if (coordinate > -360 && coordinate < 360) {
    return right(coordinate);
  } else {
    return left(
      ValueFailure.invalidCoordinate(failedValue: coordinate),
    );
  }
}

/// Une coordonnée géographique est valide si elle est positive
Either<ValueFailure<double>, double> validateTemperature(double coordinate) {
  if (coordinate > -273.15) {
    return right(coordinate);
  } else {
    return left(
      ValueFailure.invalidTemperature(failedValue: coordinate),
    );
  }
}
