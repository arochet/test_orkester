import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meteo_okester/DOMAIN/location/app_location.dart';
import 'package:flutter/material.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/show_component_file.dart';

import 'package:meteo_okester/PRESENTATION/core/_components/spacing.dart';
import 'package:meteo_okester/PRESENTATION/core/_core/app_widget.dart';
import 'package:meteo_okester/providers.dart';

import 'panel_weather_data.dart';

class PanelLocationView extends ConsumerWidget {
  final AppLocation location;
  const PanelLocationView({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowComponentFile(
      title: 'PanelLocationView',
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${location.place.getOrCrash()}", style: Theme.of(context).textTheme.headlineSmall),
              SpaceH10(),
              Text("Coordinates (${location.latitude.getOrCrash()}:${location.longitude.getOrCrash()})",
                  style: Theme.of(context).textTheme.bodyMedium),
              //insert-info

              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: location.listWeatherData
                      .map(
                        (e) => PanelWeatherData(weatherData: e),
                      )
                      .toList(),
                ),
              ),
              //BOUTON SUPPRIMER
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ref.read(locationRepositoryProvider).delete(location.id);
                  },
                  label: Text(""),
                  style: Theme.of(context).extension<AppThemeExtention>()?.buttonDanger,
                  icon: Icon(Icons.delete),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
