// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maybank2u/application/injector.dart';

import 'package:maybank2u/main.dart';
import 'package:maybank2u/ui/splash/splash.dart';

void main() {

  setUpAll(() {
    setupLocator();
  });

  testWidgets('Nothing Leak at Splash', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(
      home: Splash(),
    ));

    await tester.pump();

    // Verify that our counter starts at 0.
    expect(find.byKey(Key('splash')), findsOneWidget);
  });
}
