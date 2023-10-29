import 'package:dartz/dartz.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/errors/failures.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:digital_dreams_shop/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  const AuthRepositoryImpl(this._authRemoteDataSource);

  final AuthRemoteDataSource _authRemoteDataSource;

  @override
  ResultFuture<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _authRemoteDataSource.logInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<String> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  ResultFuture<void> logInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  ResultFuture<void> logInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  ResultFuture<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  ResultFuture<void> signUp({
    required String email,
    required String password,
    required int phoneNumber,
  }) {
    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  ResultFuture<void> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  ResultFuture<void> updateUser() {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
