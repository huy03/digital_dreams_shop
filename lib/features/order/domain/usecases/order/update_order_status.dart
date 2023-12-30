import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/order/data/models/order_model.dart';

import 'package:digital_dreams_shop/features/order/domain/entities/order.dart';

import 'package:digital_dreams_shop/features/order/domain/repositories/order_repository.dart';

class UpdateOrderStatus
    extends UseCaseWithParams<void, UpdateOrderStatusParams> {
  final OrderRepository repository;

  UpdateOrderStatus(this.repository);

  @override
  ResultFuture<void> call(UpdateOrderStatusParams params) {
    return repository.updateOrderStatus(params.orderId, params.status);
  }
}

class UpdateOrderStatusParams {
  final String orderId;
  final String status;

  UpdateOrderStatusParams({
    required this.orderId,
    required this.status,
  });
}
