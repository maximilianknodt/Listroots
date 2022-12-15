import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/auth/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // TODO: Remove
  AuthBloc() : super(Authenticated(User("remove", "remove"))) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
