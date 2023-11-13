import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/products/domain/repositories/product_repository.dart';

class SearchProductsByName extends UseCaseWithParams<List<Product>, String> {
  const SearchProductsByName(this.repository);

  final ProductRepository repository;

  @override
  ResultFuture<List<Product>> call(String params) {
    return repository.searchProductByName(params);
  }
}
