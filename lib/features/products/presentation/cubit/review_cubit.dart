import 'package:bloc/bloc.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/review.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/review/get_product_review.dart';
import 'package:equatable/equatable.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  final GetProductReviews getProductReviews;

  ReviewCubit({required this.getProductReviews}) : super(ReviewInitial());

  void fetchReviews(String productId) async {
    emit(ReviewLoading());
    final result = await getProductReviews.call(productId);
    result.fold(
      (failure) => emit(ReviewFail(message: failure.errorMessage)),
      (reviews) => emit(ReviewLoaded(reviews: reviews)),
    );
  }
}
