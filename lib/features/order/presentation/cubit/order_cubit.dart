import 'package:bloc/bloc.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/order.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/order_item.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(const OrderState());

  void addOrderItem(List<OrderItem> items) {
    int totalOrderPrice = 0;
    for (var orderItem in items) {
      totalOrderPrice += orderItem.price * orderItem.quantity;
    }
    emit(state.copyWith(
      orderItems: [...items],
      totalOrderPrice: totalOrderPrice,
    ));
  }
}
