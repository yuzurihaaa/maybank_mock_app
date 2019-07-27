import 'dart:async';
import 'package:bloc/bloc.dart';

import '../bloc.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  @override
  DrawerState get initialState => InitialDrawerState();

  @override
  Stream<DrawerState> mapEventToState(
    DrawerEvent event,
  ) async* {

    if (event is ShowAbout) {
      yield AboutState();
    }
  }
}
