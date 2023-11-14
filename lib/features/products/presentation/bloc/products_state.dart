part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<Product> products;

  const ProductsSuccess({required this.products});

  @override
  List<Object> get props => [products];
}

final class NewArrivalProductsSuccess extends ProductsState {
  final List<Product> products;

  const NewArrivalProductsSuccess({required this.products});

  @override
  List<Object> get props => [products];
}

final class PopularProductsSuccess extends ProductsState {
  final List<Product> products;

  const PopularProductsSuccess({required this.products});

  @override
  List<Object> get props => [products];
}

final class SearchProductsSuccess extends ProductsState {
  final List<Product> products;

  const SearchProductsSuccess({required this.products});

  @override
  List<Object> get props => [products];
}

final class SearchProductsPerCategorySuccess extends ProductsState {
  final List<Product> products;

  const SearchProductsPerCategorySuccess({required this.products});

  @override
  List<Object> get props => [products];
}

final class ProductSuccess extends ProductsState {
  final Product product;

  const ProductSuccess({required this.product});

  @override
  List<Object> get props => [product];
}

final class AddOrRemoveProductWishlistSuccess extends ProductsState {
  const AddOrRemoveProductWishlistSuccess();

  @override
  List<Object> get props => [];
}

final class ProductsError extends ProductsState {
  final String message;

  const ProductsError(this.message);

  @override
  List<Object> get props => [message];
}
