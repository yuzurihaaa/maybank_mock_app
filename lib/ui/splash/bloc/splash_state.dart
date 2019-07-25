import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SplashState extends Equatable {
  SplashState([List props = const []]) : super(props);
}

class InitialSplashState extends SplashState {}
