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
  final AppLocation? location;
  const PanelListWeatherDataToday({
    required this.positionGPS,
    required this.location,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (positionGPS == null) {
      return Container();
    }

    return ShowComponentFile(
      title: 'PanelListWeatherDataToday',
      child: PanelLocationView(
        location: location,
        dateSearch: DateTime.now(),
        displayDeleteButton: false,
      ),
    );
  }
}
