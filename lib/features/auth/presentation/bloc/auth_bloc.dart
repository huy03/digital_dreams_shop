import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:digital_dreams_shop/core/utils/injection_container.dart';
import 'package:digital_dreams_shop/features/auth/domain/entities/user.dart';
import 'package:digital_dreams_shop/features/auth/domain/usecases/log_in_with_email_and_password.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LogInWithEmailAndPassword logInWithEmailAndPassword;

  AuthBloc({required this.logInWithEmailAndPassword}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SignInWithEmailAndPasswordEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await logInWithEmailAndPassword.call(
        LogInWithEmailAndPasswordParams(
          email: event.email,
          password: event.password,
        ),
      );
      result.fold(
        (failure) => emit(AuthError(message: failure.errorMessage)),
        (user) => emit(
          AuthSuccess(user: user),
        ),
      );
    });
  }
}
