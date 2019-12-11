import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:maybank2u/application/application.dart';
import 'package:maybank2u/application/injector.dart';
import 'package:maybank2u/ui/splash/splash.dart';

void main() {
  setUpAll(() {
    setupLocator();
  });

  testWidgets('Nothing Leak at Splash', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(
      home: Splash(),
    ));

    await tester.pump();

    expect(find.byKey(const Key('splash')), findsOneWidget);
  });

  testWidgets('Test splash navigate to Login', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(MyApp(
        home: Splash(),
      ));

      await tester.pump();

      await tester.pump(const Duration(seconds: 1));

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('introBody')), findsOneWidget);
    });
  });
}
