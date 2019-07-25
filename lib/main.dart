import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:maybank2u/application/localizations.dart';
import 'package:maybank2u/application/navigation.dart';

import 'application/injector.dart';
import 'ui/splash/splash.dart';

void main() {
  setupLocator();
  runApp(MyApp(
    home: Splash(),
  ));
}

class MyApp extends StatelessWidget {
  final Widget home;

  const MyApp({Key key, this.home}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('MY'),
      ],
      onGenerateRoute: NavigationService.navigate,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateTitle: (context) => AppLocalizations.of(context).title,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: home,
    );
  }
}
