import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/address.dart';
import 'package:digital_dreams_shop/features/order/domain/repositories/address_repository.dart';

class GetDefaultAddress extends UseCaseWithoutParams<Address> {
  final AddressRepository repository;

  const GetDefaultAddress(this.repository);

  @override
  ResultFuture<Address> call() {
    return repository.getDefaultAddress();
  }
}
