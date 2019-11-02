import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:maybank2u/application/injector.dart';

import 'package:maybank2u/application/application.dart';
import 'package:maybank2u/ui/intro/intro.dart';

void main() {

  setUpAll(() {
    setupLocator();
  });

  testWidgets('Intro page render nicely', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(MyApp(
        home: Intro(),
      ));

      await tester.pump();

      expect(find.byKey(const Key('introBody')), findsOneWidget);

      expect(find.byKey(const Key('login')), findsOneWidget);

      // Check bottom navigation bar
      expect(find.byKey(const Key('bottomNavigationBar')), findsOneWidget);
      expect(find.text('Login'), findsNWidgets(2));
      expect(find.text('Inbox'), findsOneWidget);
      expect(find.text('QrPay'), findsOneWidget);
      expect(find.text('Raya Returns'), findsOneWidget);
      expect(find.text('secure2u'), findsOneWidget);
    });
  });

  testWidgets('Smoke test tapping bottom navigation', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(MyApp(
        home: Intro(),
      ));

      await tester.pump();

      await tester.tap(find.text('Inbox'));

      await tester.pumpAndSettle();

      await tester.tap(find.text('QrPay'));
    });
  });

  testWidgets('Smoke test drawer', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(MyApp(
        home: Intro(),
      ));

      await tester.pump();

      await tester.tap(find.byKey(const Key('drawer button')));

      await tester.pumpAndSettle();

      final drawerCloseButton = find.byKey(const Key('close button'));

      expect(drawerCloseButton, findsOneWidget);

      await tester.tap(drawerCloseButton);

      await tester.pumpAndSettle();

      expect(drawerCloseButton, findsNothing);
    });
  });
}
