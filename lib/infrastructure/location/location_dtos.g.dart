// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocationDTO _$$_LocationDTOFromJson(Map<String, dynamic> json) =>
    _$_LocationDTO(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      place: json['place'] as String,
    );

Map<String, dynamic> _$$_LocationDTOToJson(_$_LocationDTO instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'place': instance.place,
    };
