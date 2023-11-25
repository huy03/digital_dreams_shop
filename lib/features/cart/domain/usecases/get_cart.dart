import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/cart/domain/entities/cart.dart';
import 'package:digital_dreams_shop/features/cart/domain/repositories/cart_repository.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';

class GetCart extends UseCaseWithoutParams<Cart> {
  final CartRepository repository;

  GetCart(this.repository);

  @override
  ResultFuture<Cart> call() async {
    return await repository.getCart();
  }
}
