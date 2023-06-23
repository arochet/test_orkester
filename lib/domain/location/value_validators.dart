import 'package:dartz/dartz.dart';

import 'location_failure.dart';

/// Une coordonnée géographique est valide si elle est positive
Either<LocationFailure, double> validateCoordinate(double coordinate) {
  if (coordinate > 0) {
    return right(coordinate);
  } else {
    return left(
      LocationFailure.invalidCoordinate(coordinate),
    );
  }
}
