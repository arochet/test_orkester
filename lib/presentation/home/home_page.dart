import 'package:auto_route/auto_route.dart';
import 'package:meteo_okester/DOMAIN/auth/user_data.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/app_async.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/show_component_file.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/show_environment_widget.dart';
import 'package:meteo_okester/PRESENTATION/core/_core/app_widget.dart';
import 'package:meteo_okester/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:meteo_okester/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widget/main_panel.dart';

/// Page d'accueil
@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowEnvironment(
      child: ShowComponentFile(
        title: 'home/home_page.dart',
        child: Center(
          child: MainPanel(),
        ),
      ),
    );
  }
}
