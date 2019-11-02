import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:maybank2u/application/application.dart';
import 'package:maybank2u/application/injector.dart';
import 'package:maybank2u/ui/intro/widgets/inbox.dart';

void main() {

  setUpAll(() {
    setupLocator();
  });

  testWidgets('Test InboxItem with null value', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      const widget = Material(
        child: InboxItem(),
      );

      await tester.pumpWidget(const MyApp(
        home: widget,
      ));

      await tester.pump();
    });
  });

  testWidgets('Test inbox screen', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      final widget = Inbox();

      await tester.pumpWidget(MyApp(
        home: widget,
      ));

      await tester.pump();

      await tester.tap(find.text('TRANSACTION'));

      await tester.pumpAndSettle();

      await tester.tap(find.text('MY MESSAGES'));

      await tester.pumpAndSettle();
    });
  });
}
