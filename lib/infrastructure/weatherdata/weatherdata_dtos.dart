import 'package:location/location.dart';
import 'package:meteo_okester/DOMAIN/core/value_objects.dart';
import 'package:meteo_okester/DOMAIN/auth/value_objects.dart';
import 'package:meteo_okester/DOMAIN/location/app_location.dart';
import 'package:meteo_okester/DOMAIN/weatherdata/value_objects.dart';
import 'package:meteo_okester/DOMAIN/weatherdata/weatherdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'weatherdata_dtos.freezed.dart';
part 'weatherdata_dtos.g.dart';

@freezed
abstract class WeatherDataDTO implements _$WeatherDataDTO {
  const WeatherDataDTO._();

  const factory WeatherDataDTO({
    @JsonKey(ignore: true) String? id,
    required int date,
    required String type,
    required String idLocation,
  }) = _WeatherDataDTO;

  factory WeatherDataDTO.fromDomain(WeatherData obj) {
    return WeatherDataDTO(
      id: obj.id.getOrCrash(),
      date: obj.date.millisecondsSinceEpoch,
      type: obj.type.getOrCrash().toShortString(),
      idLocation: obj.location?.id.getOrCrash() ?? '',
    );
  }

  WeatherData toDomain(AppLocation? location) {
    return WeatherData(
      id: UniqueId.fromUniqueString(id!),
      date: DateTime.fromMillisecondsSinceEpoch(date),
      type: TypeWeather.fromString(type),
      location: location,
    );
  }

  factory WeatherDataDTO.fromJson(Map<String, dynamic> json) => _$WeatherDataDTOFromJson(json);

  factory WeatherDataDTO.fromFirestore(DocumentSnapshot doc) {
    return WeatherDataDTO.fromJson(doc.data() as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
