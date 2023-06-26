// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weatherdata_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherDataDTO _$$_WeatherDataDTOFromJson(Map<String, dynamic> json) =>
    _$_WeatherDataDTO(
      date: json['date'] as int,
      type: json['type'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
    );

Map<String, dynamic> _$$_WeatherDataDTOToJson(_$_WeatherDataDTO instance) =>
    <String, dynamic>{
      'date': instance.date,
      'type': instance.type,
      'temperature': instance.temperature,
      'windSpeed': instance.windSpeed,
    };
