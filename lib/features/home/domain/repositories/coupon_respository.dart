import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/home/domain/entities/coupon.dart';

abstract class CouponRepository {
  const CouponRepository();

  ResultFuture<List<Coupon>> getAllCoupons();
}
