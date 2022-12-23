part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventAtStart extends AuthEvent {
  final Client client;
  const AuthEventAtStart(this.client);
}

class AuthEventVerify extends AuthEvent {
  const AuthEventVerify();
}

class AuthEventCompleted extends AuthEvent {
  final String code;
  const AuthEventCompleted(this.code);
}
