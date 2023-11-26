import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final String id;
  final Product product;
  final int quantity;
  final int price;
  final String color;

  const CartItemEntity({
    required this.id,
    required this.product,
    required this.quantity,
    required this.price,
    required this.color,
  });

  @override
  List<Object> get props => [id, product, price, quantity, color];

  CartItemEntity copyWith({
    String? id,
    Product? product,
    int? quantity,
    int? price,
    String? color,
  }) {
    return CartItemEntity(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      color: color ?? this.color,
    );
  }
}
