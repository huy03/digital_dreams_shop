import 'package:dartz/dartz.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/errors/failures.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/data/models/product_model.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/wishlist/data/datasources/wishlist_remote_datasource.dart';
import 'package:digital_dreams_shop/features/wishlist/domain/repository/wishlist_repository.dart';

class WishlistRepositoryImpl extends WishlistRepository {
  const WishlistRepositoryImpl(this.remoteDataSource);

  final WishListRemoteDataSource remoteDataSource;

  @override
  ResultFuture<List<ProductModel>> getWishlist() async {
    try {
      final result = await remoteDataSource.getWishlist();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Product>> addOrRemoveProductFromWishlist(String id) async {
    try {
      final result = await remoteDataSource.addOrRemoveProductFromWishlist(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
