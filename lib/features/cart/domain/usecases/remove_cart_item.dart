import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/cart/domain/repositories/cart_repository.dart';

class RemoveCartItem extends UseCaseWithParams<void, String> {
  final CartRepository repository;

  RemoveCartItem(this.repository);

  @override
  ResultFuture<void> call(String params) async {
    return await repository.removeProduct(productId: params);
  }
}
