import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/cart/domain/repositories/cart_repository.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

class DecreaseCartQuantity
    extends UseCaseWithParams<void, DecreaseCartQuantityParams> {
  final CartRepository repository;

  DecreaseCartQuantity(this.repository);

  @override
  ResultFuture<void> call(DecreaseCartQuantityParams params) async {
    return await repository.decreaseCartQuantity(product: params.product);
  }
}

class DecreaseCartQuantityParams extends Equatable {
  final Product product;

  const DecreaseCartQuantityParams({
    required this.product,
  });

  @override
  List<Object?> get props => [product];
}
