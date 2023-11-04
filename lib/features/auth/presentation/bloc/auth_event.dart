part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInWithEmailAndPasswordEvent(
      {required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String username;
  final String phoneNumber;

  const SignUpEvent(
      {required this.email,
      required this.password,
      required this.username,
      required this.phoneNumber});

  @override
  List<Object> get props => [email, password, username];
}
