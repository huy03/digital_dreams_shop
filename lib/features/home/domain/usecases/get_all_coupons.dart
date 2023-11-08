import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/home/domain/entities/coupon.dart';
import 'package:digital_dreams_shop/features/home/domain/repositories/coupon_respository.dart';

class GetAllCoupons extends UseCaseWithoutParams<List<Coupon>> {
  final CouponRepository _repository;

  GetAllCoupons(this._repository);

  @override
  ResultFuture<List<Coupon>> call() => _repository.getAllCoupons();
}
