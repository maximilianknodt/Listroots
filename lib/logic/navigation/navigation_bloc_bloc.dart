import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listroots/view/home/home.dart';

import '../../data/navigation/bottom_navigation_destination.dart';
import '../../view/archive/archive.dart';
import '../../view/drive/drive.dart';
import '../../view/home/info_button.dart';
import '../../view/map/map.dart';
import '../../view/map/profile_icon_button.dart';

part 'navigation_bloc_event.dart';
part 'navigation_bloc_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationDefault()) {
    on<NavigationEvent>((event, emit) {});
    on<BottomNavEvent>((event, emit) {
      String route = state.destinations.elementAt(event.index).route;
      event.context.go(route);
      emit(BottomNavigationState(event.index, state.destinations));
    });
  }
}