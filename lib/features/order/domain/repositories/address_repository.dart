import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/address.dart';

abstract class AddressRepository {
  const AddressRepository();

  ResultFuture<List<Address>> getAllAddresses();
  ResultFuture<Address> getDefaultAddress();
}
