part of 'popular_categories_cubit.dart';

sealed class PopularCategoriesState extends Equatable {
  const PopularCategoriesState();

  @override
  List<Object> get props => [];
}

final class PopularCategoriesInitial extends PopularCategoriesState {}

final class PopularCategoriesLoading extends PopularCategoriesState {}

final class PopularCategoriesSuccess extends PopularCategoriesState {
  final List<Category> categories;

  const PopularCategoriesSuccess(this.categories);

  @override
  List<Object> get props => [categories];
}

final class PopularCategoriesFailure extends PopularCategoriesState {
  final String message;

  const PopularCategoriesFailure({required this.message});

  @override
  List<Object> get props => [message];
}
