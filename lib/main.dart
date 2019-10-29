import 'package:flutter/material.dart';

import 'application/application.dart';
import 'application/injector.dart';
import 'ui/splash/splash.dart';

void main() {
  setupLocator();
  runApp(MyApp(
    home: Splash(),
  ));
}
