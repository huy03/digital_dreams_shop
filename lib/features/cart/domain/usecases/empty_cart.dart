import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/cart/domain/repositories/cart_repository.dart';

class EmptyCart extends UseCaseWithoutParams<void> {
  final CartRepository repository;

  const EmptyCart(this.repository);

  @override
  ResultFuture<void> call() async {
    return await repository.emptyCart();
  }
}
