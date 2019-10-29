import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:maybank2u/application/injector.dart';
import 'package:maybank2u/application/navigation.dart';

class Splash extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      final timer = Timer(Duration(seconds: 1), () {
        locator<NavigationService>().navigateReplace('/login');
      });

      return () {
        timer.cancel();
      };
    }, [false]);

    return Scaffold(
      key: Key('splash'),
      backgroundColor: Colors.yellow[600],
      body: Center(
        child: FlutterLogo(
          size: 80,
        ),
      ),
    );
  }
}
