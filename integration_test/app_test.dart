import 'package:meteo_okester/DOMAIN/auth/user_data.dart';
import 'package:meteo_okester/DOMAIN/auth/value_objects.dart';
import 'package:meteo_okester/DOMAIN/core/value_objects.dart';
import 'package:meteo_okester/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart';
import 'package:integration_test/integration_test.dart';

import 'panel_localisation_test.dart' as panellocalisationtest;
import 'auth_page_test.dart' as connexionpage;

Future<void> main() async {
  group('[Présentation]', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    configurationInjection(Environment.test);

    panellocalisationtest.main();
    connexionpage.main();
  });
}

Widget buildMainWidget(Widget child) {
  return MediaQuery(
      data: new MediaQueryData(), child: ProviderScope(child: MaterialApp(home: Scaffold(body: child))));
}

Widget buildMainWidgetWithOption(Widget child, List<Override> option) {
  return MediaQuery(
      data: new MediaQueryData(),
      child: ProviderScope(overrides: [...option], child: MaterialApp(home: Scaffold(body: child))));
}

//////// OVERRIDE ////////
final currentUserDataOverride = FutureProvider.autoDispose<UserData?>((ref) async => UserData(
      id: UniqueId(),
      userName: Nom("MyUserName"),
      email: EmailAddress("azer@yopmail.com"),
      passwordCrypted: true,
      typeAccount: TypeAccount(TypeAccountState.email),
    ));
