import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../data/bottom_navigation_destination.dart';

part 'navigation_bloc_event.dart';
part 'navigation_bloc_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationDefault()) {
    on<NavigationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
