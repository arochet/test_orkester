import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:location/location.dart';
import 'package:meteo_okester/DOMAIN/core/value_objects.dart';
import 'package:meteo_okester/DOMAIN/auth/value_objects.dart';
import 'package:meteo_okester/DOMAIN/location/app_location.dart';
import 'package:meteo_okester/DOMAIN/weatherdata/value_objects.dart';
import 'package:meteo_okester/DOMAIN/weatherdata/weatherdata.dart';
import 'package:meteo_okester/DOMAIN/weatherdata/weatherdata_failure.dart';
import 'package:meteo_okester/INFRASTRUCTURE/weatherdata/weatherdata_repository.dart';
import 'package:meteo_okester/PRESENTATION/core/_utils/dev_utils.dart';
part 'add_weatherdata_form_notifier.freezed.dart';

@freezed
class AddWeatherDataFormData with _$AddWeatherDataFormData {
  const factory AddWeatherDataFormData({
    required WeatherData weatherData,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<WeatherDataFailure, Unit>> authFailureOrSuccessOption,
  }) = _AddWeatherDataFormData;

  factory AddWeatherDataFormData.initial() => AddWeatherDataFormData(
      weatherData: WeatherData.empty(),
      showErrorMessages: false,
      isSubmitting: false,
      authFailureOrSuccessOption: none());
}

class WeatherDataFormNotifier extends StateNotifier<AddWeatherDataFormData> {
  final IWeatherDataRepository _iWeatherDataRepository;

  WeatherDataFormNotifier(this._iWeatherDataRepository) : super(AddWeatherDataFormData.initial());

  dateChanged(DateTime param) {
    state = state.copyWith(
        weatherData: state.weatherData.copyWith(date: (param)), authFailureOrSuccessOption: none());
  }

  typeChanged(String param) {
    printDev();
    try {
      TypeWeather type = TypeWeather.fromString('typeweatherstate.$param');
      print('type $type');
      state = state.copyWith(
          weatherData: state.weatherData.copyWith(type: type), authFailureOrSuccessOption: none());
    } catch (e) {
      print('invalid $param');
    }
  }

  idLocationChanged(String param) {
    state = state.copyWith(
        weatherData: state.weatherData.copyWith(location: AppLocation.id(UniqueId.fromUniqueString(param))),
        authFailureOrSuccessOption: none());
  }
//insert-changed

  addWeatherDataPressed() async {
    printDev();
    Either<WeatherDataFailure, Unit>? failureOrSuccess;

    //insert-valid-params

    if (state.weatherData.type.isValid()) {
      state = state.copyWith(isSubmitting: true, authFailureOrSuccessOption: none());

      failureOrSuccess = await this._iWeatherDataRepository.create(state.weatherData);

      if (failureOrSuccess.isRight()) {
        state = state.copyWith(weatherData: WeatherData.empty());
      }
    } else {
      print('invalid ${state.weatherData.type.getOrCrash()}');
    }

    state = state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: failureOrSuccess != null
            ? some(failureOrSuccess)
            : none()); //optionOf -> value != null ? some(value) : none();     | optionOf ne fonctionne pas
  }
}
