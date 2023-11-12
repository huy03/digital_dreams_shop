import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/products/domain/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';

class GetProductById extends UseCaseWithParams<Product, ProductParams> {
  const GetProductById(this.repository);

  final ProductRepository repository;

  @override
  ResultFuture<Product> call(ProductParams params) {
    return repository.getProductById(params.id);
  }
}

class ProductParams extends Equatable {
  const ProductParams({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}
