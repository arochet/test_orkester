import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meteo_okester/DOMAIN/location/value_objects.dart';
import 'package:meteo_okester/DOMAIN/location/weatherdata.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/show_component_file.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/spacing.dart';
import 'package:meteo_okester/PRESENTATION/core/_core/app_widget.dart';
import 'package:meteo_okester/PRESENTATION/core/_utils/date_utils.dart';

class PanelWeatherData extends ConsumerWidget {
  final WeatherData weatherData;
  const PanelWeatherData({required this.weatherData, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowComponentFile(
      title: 'PanelWeatherData',
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        color: colorpanel(700),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
          child: Column(
            children: [
              Icon(weatherData.type.getOrCrash().toIcon(), size: 25, color: Colors.white),
              SizedBox(height: 5),
              Text("${AppDateUtils.formatDate(weatherData.date, 'dd MMM')}",
                  style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.wind_power, size: 20, color: Colors.white),
                  Text("${weatherData.windSpeed} nd", style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.thermostat, size: 20, color: Colors.white),
                  Text("${weatherData.temperature.getOrCrash()}°C",
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
