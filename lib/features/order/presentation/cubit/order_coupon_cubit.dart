import 'package:bloc/bloc.dart';
import 'package:digital_dreams_shop/features/home/domain/entities/coupon.dart';

part 'order_coupon_state.dart';

class OrderCouponCubit extends Cubit<OrderCouponState> {
  OrderCouponCubit() : super(const OrderCouponState());

  void addCoupon(Coupon coupon) {
    final coupons = [...state.coupons, coupon];
    emit(OrderCouponState(coupons: coupons));
  }
}
