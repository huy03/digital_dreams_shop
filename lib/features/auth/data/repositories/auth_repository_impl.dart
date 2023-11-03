import 'package:dartz/dartz.dart';
import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/errors/failures.dart';
import 'package:digital_dreams_shop/core/network/network_info.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:digital_dreams_shop/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:digital_dreams_shop/features/auth/data/models/user_model.dart';
import 'package:digital_dreams_shop/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  const AuthRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  @override
  ResultFuture<UserModel> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    // if (await networkInfo.isConnected) {
    try {
      final result = await remoteDataSource.logInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await localDataSource.cacheUser(result);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
    // } else {
    //   return const Left(
    //     ServerFailure(
    //       message: 'No internet connection',
    //       statusCode: 503,
    //     ),
    //   );
    // }
  }

  // @override
  // ResultFuture<String> getUser() {
  //   // TODO: implement getUser
  //   throw UnimplementedError();
  // }

  // @override
  // ResultFuture<void> logInWithFacebook() {
  //   // TODO: implement signInWithFacebook
  //   throw UnimplementedError();
  // }

  // @override
  // ResultFuture<void> logInWithGoogle() {
  //   // TODO: implement signInWithGoogle
  //   throw UnimplementedError();
  // }

  // @override
  // ResultFuture<void> signOut() {
  //   // TODO: implement signOut
  //   throw UnimplementedError();
  // }

  // @override
  // ResultFuture<void> signUp({
  //   required String email,
  //   required String password,
  //   required int phoneNumber,
  // }) {
  //   // TODO: implement signUpWithEmailAndPassword
  //   throw UnimplementedError();
  // }

  // @override
  // ResultFuture<void> forgotPassword(String email) {
  //   // TODO: implement forgotPassword
  //   throw UnimplementedError();
  // }

  // @override
  // ResultFuture<void> updateUser({
  //   required UserInfo userInfo,
  //   dynamic userData,
  // }) {
  //   // TODO: implement updateUser
  //   throw UnimplementedError();
  // }
}
