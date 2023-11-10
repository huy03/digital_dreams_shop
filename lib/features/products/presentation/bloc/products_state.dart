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

final class ProductsError extends ProductsState {
  final String message;

  const ProductsError(this.message);

  @override
  List<Object> get props => [message];
}
