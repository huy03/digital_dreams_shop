import 'package:dartz/dartz.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/errors/failures.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/home/data/data_sources/coupon_remote_datasource.dart';
import 'package:digital_dreams_shop/features/home/domain/entities/coupon.dart';
import 'package:digital_dreams_shop/features/home/domain/repositories/coupon_respository.dart';

class CouponRepositoryImpl extends CouponRepository {
  const CouponRepositoryImpl(this.remoteDataSource);

  final CouponRemoteDataSource remoteDataSource;

  @override
  ResultFuture<List<Coupon>> getAllCoupons() async {
    try {
      final result = await remoteDataSource.getAllCoupons();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
