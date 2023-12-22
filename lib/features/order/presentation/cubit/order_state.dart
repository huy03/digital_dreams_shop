part of 'order_cubit.dart';

enum OrderStatus { initial, loading, loaded, error }

class OrderState {
  final OrderEntity? order;
  final OrderStatus orderStatus;
  final List<OrderItemModel> orderItems;
  final int totalOrderPrice;
  final OrderStatus orderItemStatus;
  final String errorMessage;

  const OrderState({
    this.order,
    this.orderStatus = OrderStatus.initial,
    this.orderItems = const [],
    this.totalOrderPrice = 0,
    this.orderItemStatus = OrderStatus.initial,
    this.errorMessage = '',
  });

  OrderState copyWith({
    OrderEntity? order,
    OrderStatus? orderStatus,
    List<OrderItemModel>? orderItems,
    OrderStatus? orderItemStatus,
    String? errorMessage,
    int? totalOrderPrice,
  }) {
    return OrderState(
      order: order ?? this.order,
      orderStatus: orderStatus ?? this.orderStatus,
      orderItems: orderItems ?? this.orderItems,
      orderItemStatus: orderItemStatus ?? this.orderItemStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      totalOrderPrice: totalOrderPrice ?? this.totalOrderPrice,
    );
  }
}
