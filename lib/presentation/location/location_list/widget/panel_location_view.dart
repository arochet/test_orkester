import 'package:meteo_okester/DOMAIN/location/location.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import '../../../core/_core/router.dart';

class PanelLocationView extends StatelessWidget {
  final Location location;
  const PanelLocationView({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("id : ${location.id.getOrCrash()}", style: Theme.of(context).textTheme.bodyMedium),
            Text("latitude : ${location.latitude}", style: Theme.of(context).textTheme.bodyMedium),
            Text("longitude : ${location.longitude}", style: Theme.of(context).textTheme.bodyMedium),
            Text("place : ${location.place.getOrCrash()}", style: Theme.of(context).textTheme.bodyMedium),
//insert-info
            TextButton(
              onPressed: () {
                context.router.push(LocationViewRoute(id: location.id));
              },
              child: Text("Voir Plus"),
            ),
          ],
        ),
      ),
    );
  }
}
