part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginWithEmailAndPassWordEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginWithEmailAndPassWordEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
