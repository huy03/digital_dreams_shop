import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';

abstract class WishlistRepository {
  const WishlistRepository();

  ResultFuture<List<Product>> getWishlist();
  ResultFuture<List<Product>> addOrRemoveProductFromWishlist(String id);
  ResultFuture<List<Product>> removeProductFromWishlist(String id);
}
