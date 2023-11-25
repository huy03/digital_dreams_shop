import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/cart/domain/repositories/cart_repository.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

class AddToCart extends UseCaseWithParams<void, AddToCartParams> {
  final CartRepository repository;

  AddToCart(this.repository);

  @override
  ResultFuture<void> call(AddToCartParams params) async {
    return await repository.addToCart(
      product: params.product,
      quantity: params.quantity,
      color: params.color,
    );
  }
}

class AddToCartParams extends Equatable {
  final Product product;
  final int quantity;
  final String color;

  const AddToCartParams({
    required this.product,
    required this.quantity,
    required this.color,
  });

  @override
  List<Object?> get props => [product, quantity, color];
}
