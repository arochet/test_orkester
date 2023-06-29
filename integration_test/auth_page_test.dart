import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:meteo_okester/PRESENTATION/auth/auth_init/auth_init_page.dart';

import 'app_test.dart';

void main() {
  testWidgets(
    "Test Auth - Init Page",
    (WidgetTester tester) async {
      await tester.pumpWidget(buildMainWidget(AuthInitPage()));

      await tester.pump();
      expect(find.text("Commencer"), findsOneWidget);
    },
  );
}
