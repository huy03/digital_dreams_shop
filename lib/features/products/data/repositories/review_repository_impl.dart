import 'package:dartz/dartz.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/errors/failures.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/data/datasources/review_remote_datasource.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/review.dart';
import 'package:digital_dreams_shop/features/products/domain/repositories/review_repository.dart';

class ReviewRepositoryImpl extends ReviewRepository {
  final ReviewRemoteDataSource remoteDataSource;

  const ReviewRepositoryImpl(this.remoteDataSource);

  @override
  ResultFuture<List<Review>> getProductReviews(String productId) async {
    try {
      final result = await remoteDataSource.getProductReviews(productId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> reviewProduct(String productId, DataMap review) async {
    try {
      await remoteDataSource.reviewProduct(productId, review);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
