import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'bloc/bloc.dart';

class Splash extends HookWidget {
  @override
  Widget build(BuildContext context) {
    SplashBloc bloc;
    useEffect(() {
      bloc = SplashBloc();

      final timer = Timer(Duration(seconds: 1), () {
        bloc.dispatch(NavigateLogin());
      });

      return () {
        timer.cancel();
        bloc.dispose();
      };
    }, [bloc]);

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
