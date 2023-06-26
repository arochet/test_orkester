import 'dart:convert';

import 'package:meteo_okester/DOMAIN/core/value_objects.dart';
import 'package:meteo_okester/DOMAIN/auth/value_objects.dart';
import 'package:meteo_okester/DOMAIN/location/app_location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meteo_okester/DOMAIN/location/value_objects.dart';
part 'location_dtos.freezed.dart';
part 'location_dtos.g.dart';

@freezed
abstract class AppLocationDTO implements _$AppLocationDTO {
  const AppLocationDTO._();

  const factory AppLocationDTO({
    @JsonKey(ignore: true) String? id,
    required double latitude,
    required double longitude,
    required String place,
    required String listWeatherData,
  }) = _AppLocationDTO;

  factory AppLocationDTO.fromDomain(AppLocation obj) {
    return AppLocationDTO(
      id: obj.id.getOrCrash(),
      latitude: obj.latitude.getOrCrash(),
      longitude: obj.longitude.getOrCrash(),
      place: obj.place.getOrCrash(),
      listWeatherData: jsonEncode(obj.listWeatherData.map((e) => jsonEncode(e))),
    );
  }

  AppLocation toDomain() {
    return AppLocation(
        id: UniqueId.fromUniqueString(id!),
        latitude: Coordinate(latitude),
        longitude: Coordinate(longitude),
        place: Nom(place),
        listWeatherData: jsonDecode(listWeatherData));
  }

  factory AppLocationDTO.fromJson(Map<String, dynamic> json) => _$AppLocationDTOFromJson(json);

  factory AppLocationDTO.fromFirestore(DocumentSnapshot doc) {
    return AppLocationDTO.fromJson(doc.data() as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
