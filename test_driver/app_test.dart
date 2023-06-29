import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  // This line enables the extension
  //enableFlutterDriverExtension();

  group('[Test Driver]', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await driver.waitUntilFirstFrameRasterized(); //Test ?
    });

    tearDownAll(() async {
      driver.close();
    });

    test('Menu Principale', () async {
      await driver.clearTimeline();
      await clicSreen(driver);
      expect(await driver.getText(find.text("Accueil")), "Accueil");
    });
  });
}

clicSreen(FlutterDriver driver) async {
  //S'il l'on est déjà connecter
  await Future.delayed(const Duration(seconds: 1));
  await driver.waitFor(find.text("Recherche"));
  await driver.tap(find.text("Recherche"));
  await driver.waitFor(find.text("Compte"));
  await driver.tap(find.text("Compte"));
  await driver.waitFor(find.text("Accueil"));
  await driver.tap(find.text("Accueil"));
  await Future.delayed(const Duration(seconds: 2));
  await driver.waitFor(find.text("Accueil"), timeout: Duration(seconds: 5));
}
