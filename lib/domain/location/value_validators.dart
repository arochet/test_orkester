import 'package:dartz/dartz.dart';
import 'package:meteo_okester/DOMAIN/core/failures.dart';

import 'location_failure.dart';

/// Une coordonnée géographique est valide si elle est positive
Either<ValueFailure<double>, double> validateCoordinate(double coordinate) {
  if (coordinate > 0) {
    return right(coordinate);
  } else {
    return left(
      ValueFailure.invalidCoordinate(failedValue: coordinate),
    );
  }
}
