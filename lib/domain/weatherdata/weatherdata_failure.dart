import 'package:freezed_annotation/freezed_annotation.dart';

part 'weatherdata_failure.freezed.dart';

@freezed
abstract class WeatherDataFailure with _$WeatherDataFailure {
  const factory WeatherDataFailure.unexpected() = _Unexpected;
  const factory WeatherDataFailure.insufficientPermission() = _InsufficientPermission;
  const factory WeatherDataFailure.unableToUpdate() = _UnableToUpdate;
}
