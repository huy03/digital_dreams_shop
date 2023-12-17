import 'package:dartz/dartz.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/errors/failures.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/auth/data/models/user_model.dart';
import 'package:digital_dreams_shop/features/auth/domain/entities/user.dart';
import 'package:digital_dreams_shop/features/profile/data/datasources/profile_remote_datasources.dart';
import 'package:digital_dreams_shop/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  const ProfileRepositoryImpl(this.remoteDataSource);

  final ProfileRemoteDataSource remoteDataSource;

  @override
  ResultFuture<UserModel> getCurrentUser() async {
    try {
      final result = await remoteDataSource.getCurrentUser();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<UserModel> updateProfile({
    required String username,
    required String email,
    required String phoneNumber,
    required String gender,
    required String birthday,
  }) async {
    try {
      final result = await remoteDataSource.updateProfile(
        username: username,
        email: email,
        phoneNumber: phoneNumber,
        gender: gender,
        birthday: birthday,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
