import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DrawerEvent extends Equatable {
  DrawerEvent([List props = const []]) : super(props);
}

class ShowAbout extends DrawerEvent {}

class ShowPrevious extends DrawerEvent {}

class ShowAccount extends DrawerEvent {

}
class Reset extends DrawerEvent {}
