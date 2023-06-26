import 'package:meteo_okester/DOMAIN/weatherdata/weatherdata.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import '../../../core/_core/router.dart';

class PanelWeatherDataView extends StatelessWidget {
  final WeatherData weatherData;
  const PanelWeatherDataView({Key? key, required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("date : ${weatherData.date.toString()}", style: Theme.of(context).textTheme.labelLarge),
            Text("type : ${weatherData.type}", style: Theme.of(context).textTheme.labelLarge),
            Text("idLocation : ${weatherData.location.getOrCrash()}",
                style: Theme.of(context).textTheme.labelLarge),
//insert-info
          ],
        ),
      ),
    );
  }
}
