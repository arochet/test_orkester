import 'package:meteo_okester/firebase_options.dart';
import 'package:meteo_okester/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:meteo_okester/injection.dart';
import 'package:meteo_okester/PRESENTATION/core/_core/app_widget.dart';

import 'PRESENTATION/core/_utils/dev_utils.dart';
import 'config_reader.dart';

Future<void> mainCommon(Environment env) async {
  configurationInjection(env.name);
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();
  await Firebase.initializeApp(
    name: 'base-de-projet',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //Sert à afficher les logs en mode dev
  getIt.registerSingleton<AppLog>(AppLog());

  runApp(MainApp(env: env));
}

class MainApp extends StatelessWidget {
  final Environment env;
  const MainApp({
    Key? key,
    required this.env,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [environment.overrideWith((ref) => env)],
      child: AppWidget(),
    );
  }
}
