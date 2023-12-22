import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/order/data/models/order_model.dart';

import 'package:digital_dreams_shop/features/order/domain/entities/order.dart';

import 'package:digital_dreams_shop/features/order/domain/repositories/order_repository.dart';

class PlaceOrder extends UseCaseWithParams<void, OrderModel> {
  final OrderRepository repository;

  PlaceOrder(this.repository);

  @override
  ResultFuture<void> call(OrderModel params) {
    return repository.placeOrder(params);
  }
}
