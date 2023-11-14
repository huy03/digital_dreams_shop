import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/wishlist/domain/repository/wishlist_repository.dart';

class GetWishlist extends UseCaseWithoutParams<List<Product>> {
  const GetWishlist(this.repository);

  final WishlistRepository repository;

  @override
  ResultFuture<List<Product>> call() async {
    return await repository.getWishlist();
  }
}
