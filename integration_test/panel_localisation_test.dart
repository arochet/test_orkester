import 'package:geolocator/geolocator.dart';
import 'package:integration_test/integration_test.dart';
import 'package:meteo_okester/DOMAIN/auth/value_objects.dart';
import 'package:meteo_okester/DOMAIN/core/value_objects.dart';
import 'package:meteo_okester/DOMAIN/location/app_location.dart';
import 'package:meteo_okester/DOMAIN/location/value_objects.dart';
import 'package:meteo_okester/PRESENTATION/account/account/account_page.dart';
import 'package:meteo_okester/PRESENTATION/account/modify_account/modify_account_page.dart';
import 'package:meteo_okester/PRESENTATION/home/widget/main_panel.dart';
import 'package:meteo_okester/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart';

import 'app_test.dart';

void main() {
  testWidgets('PanelLocalisation display coordinates', (tester) async {
    await tester.pumpWidget(
      buildMainWidgetWithOption(
        PanelLocalisation(
          location: AppLocation(
              id: UniqueId.fromUniqueString('0'),
              latitude: Coordinate(10),
              longitude: Coordinate(10),
              place: Nom('Toulon'),
              listWeatherData: []),
          positionGPS: Position(
              longitude: 10,
              latitude: 10,
              timestamp: null,
              accuracy: 1,
              altitude: 10,
              heading: 10,
              speed: 10,
              speedAccuracy: 10),
        ),
        [currentUserData, environment.overrideWith((_) => Environment(Environment.test))],
      ),
    );

    // Create the Finders.
    final titleFinder = find.text('Localisation');

    expect(titleFinder, findsOneWidget);
  });
}
