import 'package:bloc/bloc.dart';
import 'package:digital_dreams_shop/features/order/data/models/order_item_model.dart';
import 'package:digital_dreams_shop/features/order/data/models/order_model.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/order.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/order_item.dart';
import 'package:digital_dreams_shop/features/order/domain/usecases/order/create_order.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final PlaceOrder placeOrder;

  OrderCubit({required this.placeOrder}) : super(const OrderState());

  void addOrderItem(List<OrderItemModel> items) {
    int totalOrderPrice = 0;
    for (var orderItem in items) {
      totalOrderPrice += orderItem.price * orderItem.quantity;
    }
    emit(state.copyWith(
      orderItems: [...items],
      totalOrderPrice: totalOrderPrice,
    ));
  }

  void createOrder(OrderModel order) async {
    await placeOrder(order);
  }

  void emptyOrder() {
    emit(state.copyWith(
      orderItems: [],
      totalOrderPrice: 0,
    ));
  }
}
