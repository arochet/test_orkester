import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meteo_okester/DOMAIN/location/app_location.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/app_async.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/app_error.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/show_component_file.dart';
import 'package:meteo_okester/PRESENTATION/location/location_list/widget/panel_location_view.dart';
import 'package:meteo_okester/providers.dart';

class PanelListWeatherDataToday extends ConsumerWidget {
  /// Position GPS de l'utilisateur
  final Position? positionGPS;
  const PanelListWeatherDataToday({
    required this.positionGPS,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (positionGPS == null) {
      return Container();
    }
    return ShowComponentFile(
      title: 'PanelListWeatherDataToday',
      child: AppAsync(
        ref.watch(allLocationProvider),
        builder: (data) => data!.fold((error) => AppError(message: error.toString()), (listLocation) {
          //Ici on recherche la location de Toulon
          //Normalement on devrait faire un calcul avec les coordonnée GPS les plus proches
          final List<AppLocation> listLoc = listLocation
              .where(
                (location) =>
                    calculateDistance(location.latitude.getOrCrash(), location.longitude.getOrCrash(),
                        positionGPS!.latitude, positionGPS!.longitude) <
                    10,
              )
              .toList();

          return PanelLocationView(
            location: listLoc.length > 0 ? listLoc[0] : null,
            dateSearch: DateTime.now(),
            displayDeleteButton: false,
          );
        }),
      ),
    );
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
