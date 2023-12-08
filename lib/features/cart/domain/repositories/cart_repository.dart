import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/cart/domain/entities/cart.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';

abstract class CartRepository {
  const CartRepository();

  ResultFuture<Cart> getCart();

  ResultFuture<void> addToCart({
    required Product product,
    required int quantity,
    required String color,
  });

  ResultFuture<void> increaseCartQuantity({
    required Product product,
  });

  ResultFuture<void> decreaseCartQuantity({
    required Product product,
  });

  ResultFuture<void> removeProduct({
    required String productId,
  });
}
