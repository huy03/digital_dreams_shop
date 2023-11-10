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
