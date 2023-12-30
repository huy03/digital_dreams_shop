import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/review.dart';

abstract class ReviewRepository {
  const ReviewRepository();

  ResultFuture<List<Review>> getProductReviews(String productId);
  ResultFuture<void> reviewProduct(String productId, DataMap review);
}
