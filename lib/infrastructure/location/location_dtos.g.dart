// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppLocationDTO _$$_AppLocationDTOFromJson(Map<String, dynamic> json) =>
    _$_AppLocationDTO(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      place: json['place'] as String,
      listWeatherData: json['listWeatherData'] as String,
    );

Map<String, dynamic> _$$_AppLocationDTOToJson(_$_AppLocationDTO instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'place': instance.place,
      'listWeatherData': instance.listWeatherData,
    };
