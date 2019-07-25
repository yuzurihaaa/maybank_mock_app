import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:maybank2u/application/injector.dart';

import 'package:maybank2u/main.dart';
import 'package:maybank2u/ui/intro/intro.dart';
import 'package:maybank2u/ui/splash/splash.dart';

void main() {

  setUpAll(() {
    setupLocator();
  });

  testWidgets('Intro page render nicely', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(MyApp(
        home: Intro(),
      ));

      await tester.pump();

      expect(find.byKey(Key('introBody')), findsOneWidget);

      expect(find.byKey(Key('login')), findsOneWidget);

      // Check bottom navigation bar
      expect(find.byKey(Key('bottomNavigationBar')), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
      expect(find.text('Inbox'), findsOneWidget);
      expect(find.text('QrPay'), findsOneWidget);
      expect(find.text('Raya Returns'), findsOneWidget);
      expect(find.text('secure2u'), findsOneWidget);
    });
  });
}
