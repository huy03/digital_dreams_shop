import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  const ProductRepository();

  ResultFuture<List<Product>> getAllProductsByCategory(String id);
  ResultFuture<Product> getProductById(String id);
  ResultFuture<List<Product>> getNewArrivalProducts();
  ResultFuture<List<Product>> getPopularProducts();
  ResultFuture<List<Product>> searchProductByName(String text);
  ResultFuture<List<Product>> searchProductsByNamePerCategory(
      String id, String text);
  ResultFuture<List<Product>> getRelevantProducts(
      String categoryId, String productId);
}
