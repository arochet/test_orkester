import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meteo_okester/DOMAIN/location/app_location.dart';
import 'package:meteo_okester/DOMAIN/location/value_objects.dart';
import 'package:meteo_okester/DOMAIN/location/weatherdata.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/app_async.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/app_error.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/show_component_file.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/spacing.dart';
import 'package:geolocator_apple/geolocator_apple.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:meteo_okester/PRESENTATION/core/_utils/date_utils.dart';
import 'package:meteo_okester/providers.dart';

import 'panel_list_weatherdata.dart';

class MainPanel extends ConsumerStatefulWidget {
  const MainPanel({Key? key}) : super(key: key);

  @override
  _MainPanelState createState() => _MainPanelState();
}

class _MainPanelState extends ConsumerState<MainPanel> {
  /// Position GPS du téléphone. Peut être null si l'utilisateur n'a pas autorisé l'accès à la position GPS
  Position? positionGPS;

  // Enregistre la plateforme utilisée pour la localisation
  void _registerPlatformInstance() {
    if (Platform.isAndroid) {
      GeolocatorAndroid.registerWith();
    } else if (Platform.isIOS) {
      GeolocatorApple.registerWith();
    }
  }

  /// Récupère la position GPS du téléphone
  Future<Position> _determinePosition() async {
    _registerPlatformInstance();

    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      positionGPS = await _determinePosition();
      setState(() {
        positionGPS = positionGPS;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppAsync(ref.watch(allLocationProvider),
        builder: (data) => data!.fold((error) => AppError(message: error.toString()), (listLocation) {
              // Chargement de la position GPS
              if (positionGPS == null) return Center(child: CircularProgressIndicator());

              // Récupère la liste des villes à proximité
              final List<AppLocation> listLoc = listLocation
                  .where(
                    (location) =>
                        calculateDistance(location.latitude.getOrCrash(), location.longitude.getOrCrash(),
                            positionGPS!.latitude, positionGPS!.longitude) <
                        10,
                  )
                  .toList();

              AppLocation? location = listLocation.length > 0 ? listLoc[0] : null;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: PanelListWeatherDataToday(positionGPS: positionGPS, location: location),
                  ),
                  Expanded(flex: 2, child: PanelLocalisation(positionGPS: positionGPS, location: location)),
                ],
              );
            }));
  }

  /// Calcul de la distance entre deux points GPS. Retourne la distance en kilomètres
  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const int earthRadius = 6371; // Rayon de la Terre en kilomètres

    double dLat = _toRadians(lat2 - lat1);
    double dLon = _toRadians(lon2 - lon1);

    double a = pow(sin(dLat / 2), 2) + cos(_toRadians(lat1)) * cos(_toRadians(lat2)) * pow(sin(dLon / 2), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    double distance = earthRadius * c;
    return distance;
  }

  double _toRadians(double degree) {
    return degree * pi / 180;
  }
}

class PanelLocalisation extends StatelessWidget {
  final AppLocation? location;
  const PanelLocalisation({
    required this.location,
    super.key,
    required this.positionGPS,
  });

  final Position? positionGPS;

  @override
  Widget build(BuildContext context) {
    WeatherData? weatherData = _getWeatherDataToday(location?.listWeatherData ?? []);
    return ShowComponentFile(
      title: 'PanelLocalisation',
      child: Container(
        width: double.infinity,
        child: Card(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Localisation', style: Theme.of(context).textTheme.titleLarge),
              SpaceH10(),
              Text('${positionGPS?.latitude ?? ""} / ${positionGPS?.longitude ?? ""}',
                  style: Theme.of(context).textTheme.bodyLarge),
              SpaceH40(),
              Icon((weatherData?.type.getOrCrash().toIcon()), size: 70, color: Colors.white),
              Text('${weatherData?.type.getOrCrash().toDisplayString()}',
                  style: Theme.of(context).textTheme.bodyLarge),
              SpaceH20(),
              Text('${AppDateUtils.formatDate(weatherData?.date, 'dd MMM HH')}h',
                  style: Theme.of(context).textTheme.titleLarge),
              SpaceH20(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon((Icons.thermostat), size: 30, color: Colors.white),
                  SizedBox(width: 10),
                  Text('${weatherData?.temperature.getOrCrash()}°C',
                      style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
              SpaceH10(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon((Icons.wind_power), size: 30, color: Colors.white),
                  SizedBox(width: 10),
                  Text('${weatherData?.windSpeed} nd', style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }

  /// Retourne DataWeather la plus proche de l'heure actuelle
  WeatherData? _getWeatherDataToday(List<WeatherData> listWeatherData) {
    if (listWeatherData.length == 0) return null;

    // Récupère la date actuelle
    DateTime now = DateTime.now();

    // Récupère la date la plus proche de l'heure actuelle
    WeatherData? weatherData;
    int duration = 1000000;
    for (WeatherData data in listWeatherData) {
      int diff = data.date.difference(now).inSeconds.abs();
      if (diff < duration && data.date.isSameDayAs(now) == true) {
        diff = duration;
        weatherData = data;
      }
    }

    return weatherData;
  }
}
