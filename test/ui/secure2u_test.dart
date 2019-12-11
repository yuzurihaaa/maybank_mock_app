import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:maybank2u/application/application.dart';
import 'package:maybank2u/application/injector.dart';
import 'package:maybank2u/ui/intro/intro.dart';
import 'package:maybank2u/ui/intro/widgets/secure2u.dart';

void main() {
  setUpAll(() {
    setupLocator();
  });

  testWidgets('Nothing Leak at Secure2u', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      home: Secure2u(),
    ));

    await tester.pump();

    expect(find.byKey(const Key('secure2u screen')), findsOneWidget);
  });

  testWidgets('Intro screen from Secure2u should go to first screen if cancel',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(MyApp(
        home: Intro(),
      ));

      await tester.pump();

      await tester.pumpAndSettle();

      await tester.tap(find.text('secure2u'));

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('secure2u cancel')), findsOneWidget);

      await tester.tap(find.byKey(const Key('secure2u cancel')));

      await tester.pumpAndSettle();
    });
  });
}
