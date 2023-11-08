import 'package:bloc/bloc.dart';
import 'package:digital_dreams_shop/features/home/domain/entities/coupon.dart';
import 'package:digital_dreams_shop/features/home/domain/usecases/get_all_coupons.dart';
import 'package:equatable/equatable.dart';

part 'coupon_state.dart';

class CouponCubit extends Cubit<CouponState> {
  final GetAllCoupons getAllCoupons;

  CouponCubit({required this.getAllCoupons}) : super(CouponInitial());

  Future<void> fetchAllCoupons() async {
    emit(CouponLoading());
    final result = await getAllCoupons.call();
    result.fold(
      (failure) => emit(CouponError(message: failure.errorMessage)),
      (coupons) => emit(CouponSuccess(coupons)),
    );
  }
}
