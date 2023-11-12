import 'package:dartz/dartz.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/errors/failures.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/data/datasources/category_remote_datasources.dart';
import 'package:digital_dreams_shop/features/products/data/models/category_model.dart';
import 'package:digital_dreams_shop/features/products/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  const CategoryRepositoryImpl(this.remoteDataSource);

  @override
  ResultFuture<List<CategoryModel>> getAllCategories() async {
    try {
      final result = await remoteDataSource.getAllCategories();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<CategoryModel>> getPopularCategories() async {
    try {
      final result = await remoteDataSource.getPopularCategories();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
