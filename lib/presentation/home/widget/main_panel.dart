import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/show_component_file.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/spacing.dart';
import 'package:geolocator_apple/geolocator_apple.dart';
import 'package:geolocator_android/geolocator_android.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: PanelListWeatherDataToday(positionGPS: positionGPS),
        ),
        Expanded(flex: 2, child: PanelLocalisation(positionGPS: positionGPS)),
      ],
    );
  }
}

class PanelLocalisation extends StatelessWidget {
  const PanelLocalisation({
    super.key,
    required this.positionGPS,
  });

  final Position? positionGPS;

  @override
  Widget build(BuildContext context) {
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
              Text('Localisation : ${positionGPS?.latitude ?? ""} / ${positionGPS?.longitude ?? ""}'),
              SpaceH20(),
              Text('Température : '),
            ],
          )),
        ),
      ),
    );
  }
}
