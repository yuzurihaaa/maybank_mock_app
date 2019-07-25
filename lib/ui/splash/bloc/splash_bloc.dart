import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:maybank2u/application/injector.dart';
import 'package:maybank2u/application/navigation.dart';
import './bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  @override
  SplashState get initialState => InitialSplashState();

  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    if (event is NavigateLogin) {
      locator<NavigationService>().navigateReplace('/login');
    }
  }
}
