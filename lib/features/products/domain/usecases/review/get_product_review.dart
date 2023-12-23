import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/review.dart';
import 'package:digital_dreams_shop/features/products/domain/repositories/review_repository.dart';

class GetProductReviews extends UseCaseWithParams<List<Review>, String> {
  const GetProductReviews(this.repository);

  final ReviewRepository repository;

  @override
  ResultFuture<List<Review>> call(String params) {
    return repository.getProductReviews(params);
  }
}
