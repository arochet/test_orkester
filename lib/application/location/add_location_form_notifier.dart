import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meteo_okester/DOMAIN/core/value_objects.dart';
import 'package:meteo_okester/DOMAIN/auth/value_objects.dart';
import 'package:meteo_okester/DOMAIN/location/app_location.dart';
import 'package:meteo_okester/DOMAIN/location/location_failure.dart';
import 'package:meteo_okester/DOMAIN/location/value_objects.dart';
import 'package:meteo_okester/INFRASTRUCTURE/location/location_repository.dart';
import 'package:meteo_okester/PRESENTATION/core/_utils/dev_utils.dart';
part 'add_location_form_notifier.freezed.dart';

@freezed
class AddLocationFormData with _$AddLocationFormData {
  const factory AddLocationFormData({
    required AppLocation location,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<LocationFailure, Unit>> authFailureOrSuccessOption,
  }) = _AddLocationFormData;

  factory AddLocationFormData.initial() => AddLocationFormData(
      location: AppLocation.empty(),
      showErrorMessages: false,
      isSubmitting: false,
      authFailureOrSuccessOption: none());
}

class LocationFormNotifier extends StateNotifier<AddLocationFormData> {
  final ILocationRepository _iLocationRepository;

  LocationFormNotifier(this._iLocationRepository) : super(AddLocationFormData.initial());

  idChanged(String param) {
    state = state.copyWith(
        location: state.location.copyWith(id: UniqueId.fromUniqueString(param)),
        authFailureOrSuccessOption: none());
  }

  latitudeChanged(String param) {
    double? value = double.tryParse(param);
    state = state.copyWith(
        location: state.location.copyWith(latitude: Coordinate(value ?? -1)),
        authFailureOrSuccessOption: none());
  }

  longitudeChanged(String param) {
    double? value = double.tryParse(param);
    state = state.copyWith(
        location: state.location.copyWith(longitude: Coordinate(value ?? -1)),
        authFailureOrSuccessOption: none());
  }

  placeChanged(String param) {
    state = state.copyWith(
        location: state.location.copyWith(place: Nom(param)), authFailureOrSuccessOption: none());
  }
//insert-changed

  addLocationPressed() async {
    printDev();
    Either<LocationFailure, Unit>? failureOrSuccess;

    final isLatValid = state.location.latitude.isValid();
    final isLongValid = state.location.longitude.isValid();
    final isplaceValid = state.location.place.isValid();
    //insert-valid-params
    if (isLatValid && isLongValid && isplaceValid) {
      state = state.copyWith(isSubmitting: true, authFailureOrSuccessOption: none());

      failureOrSuccess = await this._iLocationRepository.create(state.location);

      if (failureOrSuccess.isRight()) {
        state = state.copyWith(location: AppLocation.empty());
      }
    }

    state = state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: failureOrSuccess != null
            ? some(failureOrSuccess)
            : none()); //optionOf -> value != null ? some(value) : none();     | optionOf ne fonctionne pas
  }
}
