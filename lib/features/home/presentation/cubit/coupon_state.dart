part of 'coupon_cubit.dart';

sealed class CouponState extends Equatable {
  const CouponState();

  @override
  List<Object> get props => [];
}

final class CouponInitial extends CouponState {}

final class CouponLoading extends CouponState {}

final class CouponSuccess extends CouponState {
  final List<Coupon> coupons;

  const CouponSuccess(this.coupons);

  @override
  List<Object> get props => [coupons];
}

final class CouponError extends CouponState {
  final String message;

  const CouponError({required this.message});

  @override
  List<Object> get props => [message];
}
