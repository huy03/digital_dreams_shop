import 'package:digital_dreams_shop/features/order/domain/entities/order_item.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String id;
  final Map<String, String> shippingAddress;
  final String user;
  final List<OrderItem> items;
  final int totalQuantity;
  final int totalPrice;
  final String paymentMethod;
  final int shippingPrice;
  final String orderStatus;

  const Order({
    required this.id,
    required this.shippingAddress,
    required this.user,
    required this.items,
    required this.totalQuantity,
    required this.totalPrice,
    required this.paymentMethod,
    required this.shippingPrice,
    required this.orderStatus,
  });

  @override
  List<Object> get props => [id];
}
