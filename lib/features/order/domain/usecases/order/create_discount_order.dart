import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/order/data/models/order_model.dart';

import 'package:digital_dreams_shop/features/order/domain/repositories/order_repository.dart';
import 'package:equatable/equatable.dart';

class PlaceDiscountOrder
    extends UseCaseWithParams<void, PlaceDiscountOrderParams> {
  final OrderRepository repository;

  PlaceDiscountOrder(this.repository);

  @override
  ResultFuture<void> call(PlaceDiscountOrderParams params) {
    return repository.placeDiscountOrder(params.order, params.totalPrice);
  }
}

class PlaceDiscountOrderParams extends Equatable {
  final OrderModel order;
  final int totalPrice;

  const PlaceDiscountOrderParams({
    required this.order,
    required this.totalPrice,
  });

  @override
  List<Object?> get props => [order, totalPrice];
}
