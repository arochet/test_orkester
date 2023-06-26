import 'widget/panel_location_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/app_async.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/app_error.dart';
import 'package:meteo_okester/DOMAIN/core/value_objects.dart';
import 'widget/panel_location_view.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/spacing.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:meteo_okester/APPLICATION/location/add_location_form_notifier.dart';
import 'package:meteo_okester/PRESENTATION/core/_core/app_widget.dart';
import 'package:meteo_okester/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';

@RoutePage()
class LocationViewPage extends ConsumerWidget {
  final UniqueId id;
  const LocationViewPage({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainScaffold(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppAsync(ref.watch(oneLocationProvider(id)),
              builder: (data) => data!.fold((error) => AppError(message: error.toString()),
                  (location) => PanelLocationView(location: location))),
          SpaceH10(),
          ElevatedButton(
            onPressed: () {
              ref.read(locationRepositoryProvider).delete(id);
              context.router.pop();
            },
            child: Text(AppLocalizations.of(context)!.supprimer),
            style: Theme.of(context).extension<AppThemeExtention>()?.buttonDanger,
          ),
        ],
      ),
    ));
  }
}