import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:maybank2u/application/injector.dart';
import 'package:maybank2u/application/localizations.dart';
import 'package:maybank2u/application/navigation.dart';

class MyApp extends StatelessWidget {

  const MyApp({Key key, this.home}) : super(key: key);

  final Widget home;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('MY'),
      ],
      onGenerateRoute: NavigationService.navigate,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateTitle: (BuildContext context) => AppLocalizations.of(context).title,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          primarySwatch: Colors.amber,
          primaryColor: Colors.amber[800],
          accentColor: Colors.black,
          iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
          textTheme: Theme.of(context).textTheme.copyWith(
              headline: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(color: Colors.white),
              subtitle: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: Colors.white))),
      home: home,
    );
  }
}
