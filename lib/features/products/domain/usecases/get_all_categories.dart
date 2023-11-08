import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/category.dart';
import 'package:digital_dreams_shop/features/products/domain/repositories/category_repository.dart';

class GetAllCategories extends UseCaseWithoutParams<List<Category>> {
  final CategoryRepository _repository;

  GetAllCategories(this._repository);

  @override
  ResultFuture<List<Category>> call() => _repository.getAllCategories();
}
