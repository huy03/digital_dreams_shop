import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

class OrderItem extends Equatable {
  final String id;
  final Product product;
  final int quantity;
  final int price;
  final String color;

  const OrderItem({
    required this.id,
    required this.product,
    required this.quantity,
    required this.price,
    required this.color,
  });

  @override
  List<Object> get props => [product, price, quantity, color];
}
