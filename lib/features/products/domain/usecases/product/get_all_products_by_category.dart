import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/products/domain/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';

class GetAllProductsByCategory
    extends UseCaseWithParams<List<Product>, CategoryParams> {
  const GetAllProductsByCategory(this.repository);

  final ProductRepository repository;

  @override
  ResultFuture<List<Product>> call(CategoryParams params) {
    return repository.getAllProductsByCategory(params.id);
  }
}

class CategoryParams extends Equatable {
  const CategoryParams({
    required this.id,
    this.name,
  });

  final String id;
  final String? name;

  @override
  List<Object?> get props => [id, name];
}
