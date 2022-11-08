import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/navigation/bottom_navigation_destination.dart';

part 'navigation_bloc_event.dart';
part 'navigation_bloc_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationDefault()) {
    on<NavigationEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<BottomNavEvent>((event, emit) {
      String route = state.destinations.elementAt(event.index).route;
      event.context.go(route);
      emit(BottomNavigationState(event.index, state.destinations));
    });
  }
}
