import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:maybank2u/application/injector.dart';
import 'package:maybank2u/application/application.dart';
import 'package:maybank2u/ui/intro/widgets/drawer/drawer.dart';

void main() {
  setUpAll(() {
    setupLocator();
  });

  testWidgets('Test drawer close function called', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    provideMockedNetworkImages(() async {
      bool drawerClosed = false;
      await tester.pumpWidget(MyApp(
        home: MainDrawer(
          closeDrawer: () {
            drawerClosed = true;
          },
        ),
      ));

      await tester.pump();

      await tester.tap(find.byKey(const Key('close button')));

      await tester.pumpAndSettle();

      expect(drawerClosed, true);
    });
  });

  testWidgets('Test drawer tap about', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(const MyApp(
        home: MainDrawer(),
      ));

      await tester.pump();

      await tester.tap(find.byKey(const Key('about button')));

      await tester.pumpAndSettle();

      expect(find.text('Terms & Conditions'), findsOneWidget);
    });
  });

  testWidgets(
      'Test click close button in about will return to initial drawer screen',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(const MyApp(
        home: MainDrawer(),
      ));

      await tester.pump();

      await tester.tap(find.byKey(const Key('about button')));

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('initial drawer')), findsNothing);
      expect(find.text('Terms & Conditions'), findsOneWidget);

      await tester.tap(find.byKey(const Key('close button')));

      await tester.pumpAndSettle();

      expect(find.text('Terms & Conditions'), findsNothing);
      expect(find.byKey(const Key('initial drawer')), findsOneWidget);
    });
  });

  testWidgets(
      'Click on account should make the drawer screen show only the manage account button',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(const MyApp(
        home: MainDrawer(),
      ));

      await tester.pump();

      expect(find.byKey(const Key('account')), findsOneWidget);
      expect(find.byKey(const Key('manage account')), findsNothing);

      await tester.tap(find.byKey(const Key('account')));

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('manage account')), findsOneWidget);
    });
  });

  testWidgets('Click back on account state should return to original state',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(const MyApp(
        home: MainDrawer(),
      ));

      await tester.pump();

      expect(find.byKey(const Key('account')), findsOneWidget);
      expect(find.byKey(const Key('manage account')), findsNothing);

      await tester.tap(find.byKey(const Key('account')));

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('manage account')), findsOneWidget);

      await tester.tap(find.byKey(const Key('close button')));

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('manage account')), findsNothing);
    });
  });
}
