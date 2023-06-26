import 'widget/location_form.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:meteo_okester/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class LocationAddPage extends StatelessWidget {
  const LocationAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'LocationAdd',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: LocationFormProvider(),
        ),
      ),
    );
  }
}
