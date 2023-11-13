import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/products/domain/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';

class SearchProductsByNamePerCategory extends UseCaseWithParams<List<Product>,
    SearchProductsByNamePerCategoryParams> {
  const SearchProductsByNamePerCategory(this.repository);

  final ProductRepository repository;

  @override
  ResultFuture<List<Product>> call(
      SearchProductsByNamePerCategoryParams params) {
    return repository.searchProductsByNamePerCategory(params.id, params.text);
  }
}

class SearchProductsByNamePerCategoryParams extends Equatable {
  const SearchProductsByNamePerCategoryParams({
    required this.id,
    required this.text,
  });

  final String id;
  final String text;

  @override
  List<Object?> get props => [id, text];
}
