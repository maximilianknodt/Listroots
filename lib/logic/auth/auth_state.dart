part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthLoading extends AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  Authenticated(this.user);

  final User user;
}
