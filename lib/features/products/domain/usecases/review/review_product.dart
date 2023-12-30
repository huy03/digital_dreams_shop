import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';

import 'package:digital_dreams_shop/features/products/domain/repositories/review_repository.dart';
import 'package:equatable/equatable.dart';

class ReviewProduct extends UseCaseWithParams<void, ReviewProductParams> {
  const ReviewProduct(this.repository);

  final ReviewRepository repository;

  @override
  ResultFuture<void> call(ReviewProductParams params) {
    return repository.reviewProduct(params.productId, params.review);
  }
}

class ReviewProductParams extends Equatable {
  final String productId;
  final DataMap review;

  const ReviewProductParams({required this.productId, required this.review});

  @override
  List<Object?> get props => [productId, review];
}
