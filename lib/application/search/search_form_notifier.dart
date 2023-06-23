import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meteo_okester/DOMAIN/core/failures.dart';
import 'package:meteo_okester/DOMAIN/core/value_objects.dart';
import 'package:meteo_okester/DOMAIN/auth/value_objects.dart';
import 'package:meteo_okester/DOMAIN/location/app_location.dart';
import 'package:meteo_okester/DOMAIN/location/location_failure.dart';
import 'package:meteo_okester/DOMAIN/location/value_objects.dart';
import 'package:meteo_okester/INFRASTRUCTURE/location/location_repository.dart';
import 'package:meteo_okester/PRESENTATION/core/_utils/dev_utils.dart';
part 'search_form_notifier.freezed.dart';

@freezed
class SearchFormData with _$SearchFormData {
  const factory SearchFormData({
    required String place,
    required DateTime date,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<ValueFailure, Unit>> authFailureOrSuccessOption,
  }) = _SearchFormData;

  factory SearchFormData.initial() => SearchFormData(
      place: '',
      date: DateTime.now(),
      showErrorMessages: false,
      isSubmitting: false,
      authFailureOrSuccessOption: none());
}

class LocationFormNotifier extends StateNotifier<SearchFormData> {
  final ILocationRepository _iLocationRepository;

  LocationFormNotifier(this._iLocationRepository) : super(SearchFormData.initial());

  placeChanged(String param) {
    state = state.copyWith(place: param, authFailureOrSuccessOption: none());
  }

  dateChanged(DateTime param) {
    state = state.copyWith(date: param, authFailureOrSuccessOption: none());
  }
//insert-changed

  addLocationPressed() async {
    /* printDev();
    Either<LocationFailure, Unit>? failureOrSuccess;

    //insert-valid-params
    if (true) {
      state = state.copyWith(isSubmitting: true, authFailureOrSuccessOption: none());

      failureOrSuccess = await this._iLocationRepository.create();

      if (failureOrSuccess.isRight()) {
        state = state.copyWith(place: '');
      }
    }

    state = state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: failureOrSuccess != null
            ? some(failureOrSuccess)
            : none()); */ //optionOf -> value != null ? some(value) : none();     | optionOf ne fonctionne pas
  }
}
