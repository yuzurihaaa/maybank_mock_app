import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maybank2u/application/application.dart';
import 'package:maybank2u/application/injector.dart';
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
}
