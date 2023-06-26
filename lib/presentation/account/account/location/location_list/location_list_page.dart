import 'package:meteo_okester/DOMAIN/location/app_location.dart';

import 'widget/panel_location_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:meteo_okester/PRESENTATION/core/_core/router.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:meteo_okester/APPLICATION/location/add_location_form_notifier.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/app_async.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/app_error.dart';
import 'package:meteo_okester/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';

@RoutePage()
class LocationListPage extends ConsumerWidget {
  const LocationListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainScaffold(
        title: "Localisations",
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppAsync(
              ref.watch(allLocationProvider),
              builder: (data) => data!.fold(
                  (error) => AppError(message: error.toString()),
                  (listLocation) => ListView(children: [
                        ElevatedButton(
                          onPressed: () {
                            context.router.push(LocationAddRoute());
                          },
                          child: Text("Ajout"),
                        ),
                        ...listLocation
                            .map<Widget>((AppLocation locationObj) =>
                                PanelLocationView(location: locationObj, dateSearch: null))
                            .toList()
                      ])),
            )));
  }
}
