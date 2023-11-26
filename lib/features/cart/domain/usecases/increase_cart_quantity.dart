import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/cart/domain/repositories/cart_repository.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

class IncreaseCartQuantity
    extends UseCaseWithParams<void, IncreaseCartQuantityParams> {
  final CartRepository repository;

  IncreaseCartQuantity(this.repository);

  @override
  ResultFuture<void> call(IncreaseCartQuantityParams params) async {
    return await repository.increaseCartQuantity(product: params.product);
  }
}

class IncreaseCartQuantityParams extends Equatable {
  final Product product;

  const IncreaseCartQuantityParams({
    required this.product,
  });

  @override
  List<Object?> get props => [product];
}
