import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import '../../../data/map/banner_message.dart';
import '../../auth/auth_bloc.dart';

part 'map_messaging_event.dart';
part 'map_messaging_state.dart';

class MapMessagingBloc extends Bloc<MapMessagingEvent, MapMessagingState> {
  final Duration duration;
  final AuthBloc? authBloc;
  // TODO: final DatabaseBloc databaseBloc;

  MapMessagingBloc({
    required this.authBloc,
    this.duration = const Duration(seconds: 3),
  }) : super(MapMessagingInitial()) {
    on<MapMessagingEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AddMessage>(_addMessage);
    on<RemoveMessage>(_removeMessage);

    if (authBloc != null) {
      authBloc!.stream.listen(_authBlocListener);
      _authBlocListener(authBloc!.state);
    }
  }

  void _authBlocListener(AuthState state) {
    if (state is Unauthenticated) {
      add(AddMessage(
        BannerMessage(
          key: ValueKey('auth_message_unauthenticated'),
          type: BannerMessageType.error,
          title: 'Du bist nicht bei OSM eingeloggt!',
          isStationary: true,
        ),
      ));
    } else {
      add(RemoveMessage(ValueKey('auth_message_unauthenticated')));
    }
  }

  FutureOr<void> _addMessage(event, emit) async {
    final BannerMessage message = event.message;
    emit(MapMessagingLoaded([...state.messages, message]));
    if (!message.isStationary) {
      await Future.delayed(duration);
      add(RemoveMessage(message.key));
    }
  }

  FutureOr<void> _removeMessage(RemoveMessage event, emit) {
    final List<BannerMessage> messages = state.messages;
    final int length = messages.length;
    messages.removeWhere((message) => message.key == event.key);
    if (messages.length != length) {
      emit(MapMessagingLoaded(messages));
    }
  }
}
