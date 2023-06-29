import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meteo_okester/DOMAIN/auth/value_objects.dart';
import 'package:meteo_okester/DOMAIN/core/value_objects.dart';
import 'package:meteo_okester/DOMAIN/location/app_location.dart';
import 'package:meteo_okester/DOMAIN/location/value_objects.dart';
import 'package:meteo_okester/PRESENTATION/home/widget/main_panel.dart';

void main() {
  group('Test AppLocation', () {
    AppLocation appLocation = AppLocation.empty();

    test('Test initialisation', () {
      expect(appLocation.latitude, Coordinate(0));
      expect(appLocation.longitude, Coordinate(0));
      expect(appLocation.place, Nom(''));
      expect(appLocation.listWeatherData, []);
    });
  });
}
