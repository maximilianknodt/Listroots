import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:listroots/data/auth/oauth_main.dart';
import 'package:meta/meta.dart';

import '../../data/auth/client.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final OAuthMain _oauthMain;
  Client? client;

  AuthBloc()
      : _oauthMain = OAuthMain(),
        super(Unauthenticated()) {
    on<AuthEventAtStart>(_atStart);
    on<AuthEventVerify>(_startVerify);
    on<AuthEventCompleted>(_saveClient);
  }

  void _startVerify(AuthEvent event, Emitter<AuthState> emit) {
    emit(AuthLoading());
    _loadClient();
  }

  void _saveClient(AuthEventCompleted event, Emitter<AuthState> emit) async {
    this.client = await _oauthMain.saveClient(event.code);
    // inspect(client);
    emit(Authenticated(client!));
  }

  void _atStart(AuthEventAtStart event, Emitter<AuthState> emit) {
    emit(Authenticated(event.client));
  }

  Future<void> _loadClient() async {
    this.client = await _oauthMain.createClient();
  }
}
