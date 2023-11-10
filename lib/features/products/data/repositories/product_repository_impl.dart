import 'package:dartz/dartz.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/errors/failures.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/data/datasources/product_remote_datasources.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  const ProductRepositoryImpl(this.remoteDataSource);

  final ProductRemoteDataSource remoteDataSource;

  @override
  ResultFuture<List<Product>> getAllProductsByCategory(String id) async {
    try {
      final result = await remoteDataSource.getAllProductsByCategory(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Product>> getProductById() {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<Product>> getProductByName() {
    // TODO: implement getProductByName
    throw UnimplementedError();
  }
}
