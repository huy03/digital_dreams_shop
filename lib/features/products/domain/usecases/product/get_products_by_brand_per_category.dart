import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/products/domain/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';

class GetProductsByBrandPerCategory extends UseCaseWithParams<List<Product>,
    GetProductsByBrandPerCategoryParams> {
  const GetProductsByBrandPerCategory(this.repository);

  final ProductRepository repository;

  @override
  ResultFuture<List<Product>> call(GetProductsByBrandPerCategoryParams params) {
    return repository.getProductsByBrandPerCategory(params.id, params.brand);
  }
}

class GetProductsByBrandPerCategoryParams extends Equatable {
  const GetProductsByBrandPerCategoryParams({
    required this.id,
    required this.brand,
  });

  final String id;
  final String brand;

  @override
  List<Object?> get props => [id, brand];
}
