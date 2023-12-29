import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/order/data/models/order_model.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/order.dart';

abstract class OrderRepository {
  const OrderRepository();

  ResultFuture<void> placeOrder(OrderModel order);
  ResultFuture<List<OrderEntity>> getAllOrders(String query);
}
