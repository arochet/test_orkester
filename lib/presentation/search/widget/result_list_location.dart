import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/app_async.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/app_error.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/show_component_file.dart';
import 'package:meteo_okester/PRESENTATION/components/panel_location_view.dart';
import 'package:meteo_okester/providers.dart';

import '../../../DOMAIN/location/app_location.dart';

class ResultListLocation extends ConsumerWidget {
  /// Endroit de la recherche
  final String? placeSearch;

  /// Date de la recherche
  final DateTime? dateSearch;

  const ResultListLocation({
    super.key,
    required this.placeSearch,
    required this.dateSearch,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowComponentFile(
      title: 'ResultListLocation',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: AppAsync(
          ref.watch(allLocationProvider),
          builder: (data) => data!.fold(
              (error) => AppError(message: error.toString()),
              (listLocation) => ListView(
                  children: listLocation
                      .where((AppLocation location) {
                        String _place = location.place.getOrCrash();
                        return _place.toLowerCase().contains((placeSearch ?? '').toLowerCase());
                      })
                      .map<Widget>((AppLocation locationObj) => PanelLocationView(
                            location: locationObj,
                            dateSearch: dateSearch,
                          ))
                      .toList())),
        ),
      ),
    );
  }
}
