part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetAllProductsByCategoryEvent extends ProductsEvent {
  const GetAllProductsByCategoryEvent(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}

class GetProductByIdEvent extends ProductsEvent {
  const GetProductByIdEvent(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}

class GetNewArrivalProductsEvent extends ProductsEvent {
  const GetNewArrivalProductsEvent();

  @override
  List<Object> get props => [];
}

class GetPopularProductsEvent extends ProductsEvent {
  const GetPopularProductsEvent();

  @override
  List<Object> get props => [];
}

class SearchProductsByNameEvent extends ProductsEvent {
  const SearchProductsByNameEvent(this.text);

  final String text;

  @override
  List<Object> get props => [text];
}

class SearchProductsByNamePerCategoryEvent extends ProductsEvent {
  const SearchProductsByNamePerCategoryEvent(this.id, this.text);

  final String id;
  final String text;

  @override
  List<Object> get props => [id, text];
}

class AddOrRemoveProductWishListEvent extends ProductsEvent {
  const AddOrRemoveProductWishListEvent(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}
