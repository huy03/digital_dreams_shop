import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/category.dart';

abstract class CategoryRepository {
  const CategoryRepository();

  ResultFuture<List<Category>> getAllCategories();
  ResultFuture<List<Category>> getPopularCategories();
}
