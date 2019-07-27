import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DrawerState extends Equatable {
  DrawerState([List props = const []]) : super(props);
}

class InitialDrawerState extends DrawerState {}

class AboutState extends DrawerState {}
