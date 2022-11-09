part of 'navigation_bloc_bloc.dart';

@immutable
abstract class NavigationEvent {}

class BottomNavEvent extends NavigationEvent {
  BottomNavEvent(this.context, this.index);

  final BuildContext context;
  final int index;
}
