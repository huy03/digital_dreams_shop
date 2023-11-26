import 'package:dartz/dartz.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/errors/failures.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/cart/data/datasources/cart_remote_datasource.dart';
import 'package:digital_dreams_shop/features/cart/domain/entities/cart.dart';
import 'package:digital_dreams_shop/features/cart/domain/repositories/cart_repository.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';

class CartRepositoryImpl extends CartRepository {
  const CartRepositoryImpl(this.remoteDataSource);

  final CartRemoteDataSource remoteDataSource;

  @override
  ResultFuture<Cart> getCart() async {
    try {
      final result = await remoteDataSource.getCart();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> addToCart({
    required Product product,
    required int quantity,
    required String color,
  }) async {
    try {
      await remoteDataSource.addToCart(
        product: product,
        quantity: quantity,
        color: color,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> decreaseCartQuantity({required Product product}) async {
    try {
      await remoteDataSource.increaseCartQuantity(product: product);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> increaseCartQuantity({required Product product}) async {
    try {
      await remoteDataSource.decreaseCartQuantity(product: product);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
