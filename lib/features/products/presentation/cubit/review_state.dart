part of 'review_cubit.dart';

sealed class ReviewState extends Equatable {
  const ReviewState();

  @override
  List<Object> get props => [];
}

final class ReviewInitial extends ReviewState {}

final class ReviewLoading extends ReviewState {}

final class ReviewLoaded extends ReviewState {
  final List<Review> reviews;

  const ReviewLoaded({required this.reviews});

  @override
  List<Object> get props => [reviews];
}

final class ReviewFail extends ReviewState {
  final String message;

  const ReviewFail({required this.message});

  @override
  List<Object> get props => [message];
}
