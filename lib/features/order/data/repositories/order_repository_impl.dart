import 'package:dartz/dartz.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/errors/failures.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/order/data/datasources/address_remote_datasource.dart';
import 'package:digital_dreams_shop/features/order/data/datasources/order_remote_datasource.dart';
import 'package:digital_dreams_shop/features/order/data/models/address_model.dart';
import 'package:digital_dreams_shop/features/order/data/models/order_model.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/address.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/order.dart';
import 'package:digital_dreams_shop/features/order/domain/repositories/address_repository.dart';
import 'package:digital_dreams_shop/features/order/domain/repositories/order_repository.dart';

class OrderRepositoryImpl extends OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  const OrderRepositoryImpl(
    this.remoteDataSource,
  );

  @override
  ResultFuture<void> placeOrder(OrderModel order) async {
    try {
      await remoteDataSource.placeOrder(order);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
