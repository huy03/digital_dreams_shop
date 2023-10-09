import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
}
