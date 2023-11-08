import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  const ProductRepository();

  ResultFuture<List<Product>> getAllProductsByCategory();
  ResultFuture<List<Product>> getRecentProducts();
  ResultFuture<List<Product>> getPopularProducts();
}
