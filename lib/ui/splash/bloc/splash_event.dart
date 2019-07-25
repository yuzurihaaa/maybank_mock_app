import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SplashEvent extends Equatable {
  SplashEvent([List props = const []]) : super(props);
}

class NavigateLogin extends SplashEvent {}
