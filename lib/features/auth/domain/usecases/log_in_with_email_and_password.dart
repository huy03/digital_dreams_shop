import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/auth/domain/entities/user.dart';
import 'package:digital_dreams_shop/features/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class LogInWithEmailAndPassword
    extends UseCaseWithParams<User, LogInWithEmailAndPasswordParams> {
  const LogInWithEmailAndPassword(this._authRepository);

  final AuthRepository _authRepository;

  @override
  ResultFuture<User> call(LogInWithEmailAndPasswordParams params) async =>
      await _authRepository.logInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
}

class LogInWithEmailAndPasswordParams extends Equatable {
  const LogInWithEmailAndPasswordParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
