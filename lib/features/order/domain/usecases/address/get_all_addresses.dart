import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/address.dart';
import 'package:digital_dreams_shop/features/order/domain/repositories/address_repository.dart';

class GetAllAddresses extends UseCaseWithoutParams<List<Address>> {
  final AddressRepository repository;

  GetAllAddresses(this.repository);

  @override
  ResultFuture<List<Address>> call() {
    return repository.getAllAddresses();
  }
}
