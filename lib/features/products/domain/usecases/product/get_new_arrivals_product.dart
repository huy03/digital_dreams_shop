import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/products/domain/repositories/product_repository.dart';

class GetNewArrivalProducts extends UseCaseWithoutParams<List<Product>> {
  const GetNewArrivalProducts(this.repository);

  final ProductRepository repository;

  @override
  ResultFuture<List<Product>> call() {
    return repository.getNewArrivalProducts();
  }
}
