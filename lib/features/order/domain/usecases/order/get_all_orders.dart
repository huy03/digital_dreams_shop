import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/order/data/models/order_model.dart';

import 'package:digital_dreams_shop/features/order/domain/entities/order.dart';

import 'package:digital_dreams_shop/features/order/domain/repositories/order_repository.dart';

class GetAllOrders extends UseCaseWithParams<List<OrderEntity>, String> {
  final OrderRepository repository;

  GetAllOrders(this.repository);

  @override
  ResultFuture<List<OrderEntity>> call(String params) {
    return repository.getAllOrders(params);
  }
}
