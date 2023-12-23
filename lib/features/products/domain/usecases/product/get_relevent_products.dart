import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/products/domain/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';

class GetRelevantProducts
    extends UseCaseWithParams<List<Product>, RelevantProductParams> {
  const GetRelevantProducts(this.repository);

  final ProductRepository repository;

  @override
  ResultFuture<List<Product>> call(RelevantProductParams params) {
    return repository.getRelevantProducts(params.categoryId, params.productId);
  }
}

class RelevantProductParams extends Equatable {
  const RelevantProductParams({
    required this.categoryId,
    required this.productId,
  });

  final String categoryId;
  final String productId;

  @override
  List<Object?> get props => [categoryId, productId];
}
