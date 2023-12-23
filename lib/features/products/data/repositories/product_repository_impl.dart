import 'package:dartz/dartz.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/errors/failures.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/data/datasources/product_remote_datasources.dart';
import 'package:digital_dreams_shop/features/products/data/models/product_model.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  const ProductRepositoryImpl(this.remoteDataSource);

  final ProductRemoteDataSource remoteDataSource;

  @override
  ResultFuture<List<ProductModel>> getAllProductsByCategory(String id) async {
    try {
      final result = await remoteDataSource.getAllProductsByCategory(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<ProductModel> getProductById(String id) async {
    try {
      final result = await remoteDataSource.getProductById(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<ProductModel>> searchProductByName(String text) async {
    try {
      final result = await remoteDataSource.searchProductByName(text);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<ProductModel>> searchProductsByNamePerCategory(
      String id, String text) async {
    try {
      final result =
          await remoteDataSource.searchProductsByNamePerCategory(id, text);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<ProductModel>> getNewArrivalProducts() async {
    try {
      final result = await remoteDataSource.getNewArrivalProducts();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<ProductModel>> getPopularProducts() async {
    try {
      final result = await remoteDataSource.getPopularProducts();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Product>> getRelevantProducts(
      String categoryId, String productId) async {
    try {
      final result =
          await remoteDataSource.getRelevantProducts(categoryId, productId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
