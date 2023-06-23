import 'package:meteo_okester/DOMAIN/core/value_objects.dart';
import 'package:meteo_okester/DOMAIN/auth/value_objects.dart';
import 'package:meteo_okester/DOMAIN/location/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meteo_okester/DOMAIN/location/value_objects.dart';
part 'location_dtos.freezed.dart';
part 'location_dtos.g.dart';

@freezed
abstract class LocationDTO implements _$LocationDTO {
  const LocationDTO._();

  const factory LocationDTO({
    @JsonKey(ignore: true) String? id,
    required double latitude,
    required double longitude,
    required String place,
  }) = _LocationDTO;

  factory LocationDTO.fromDomain(Location obj) {
    return LocationDTO(
      id: obj.id.getOrCrash(),
      latitude: obj.latitude.getOrCrash(),
      longitude: obj.longitude.getOrCrash(),
      place: obj.place.getOrCrash(),
    );
  }

  Location toDomain() {
    return Location(
      id: UniqueId.fromUniqueString(id!),
      latitude: Coordinate(latitude),
      longitude: Coordinate(longitude),
      place: Nom(place),
    );
  }

  factory LocationDTO.fromJson(Map<String, dynamic> json) => _$LocationDTOFromJson(json);

  factory LocationDTO.fromFirestore(DocumentSnapshot doc) {
    return LocationDTO.fromJson(doc.data() as Map<String, dynamic>).copyWith(id: doc.id);
  }
}
