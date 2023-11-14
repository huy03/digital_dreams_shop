import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/domain/repositories/product_repository.dart';

class AddOrRemoveProductWishList extends UseCaseWithParams<void, String> {
  AddOrRemoveProductWishList(this.repository);

  final ProductRepository repository;

  @override
  ResultFuture<void> call(String params) async {
    return repository.addOrRemoveProductWishlist(params);
  }
}
