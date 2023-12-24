import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/order/data/models/address_model.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/address.dart';

abstract class AddressRepository {
  const AddressRepository();

  ResultFuture<List<Address>> getAllAddresses();
  ResultFuture<Address> getDefaultAddress();
  ResultFuture<void> addAddress(AddressModel address);
  ResultFuture<void> updateAddress(AddressModel address);
  ResultFuture<void> deleteAddress(AddressModel address);
}
