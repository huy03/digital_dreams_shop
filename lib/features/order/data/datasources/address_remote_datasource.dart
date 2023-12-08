import 'package:digital_dreams_shop/features/order/data/models/address_model.dart';

abstract class AddressRemoteDataSource {
  const AddressRemoteDataSource();

  Future<List<AddressModel>> getAllAddresses();
  Future<AddressModel> getDefaultAddress();
}

class AddressRemoteDataSourceImpl extends AddressRemoteDataSource {
  const AddressRemoteDataSourceImpl();

  @override
  Future<List<AddressModel>> getAllAddresses() {
    // TODO: implement getAllAddresses
    throw UnimplementedError();
  }

  @override
  Future<AddressModel> getDefaultAddress() {
    // TODO: implement getDefaultAddress
    throw UnimplementedError();
  }
}
