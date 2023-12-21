import 'package:dartz/dartz.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/errors/failures.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/order/data/datasources/address_remote_datasource.dart';
import 'package:digital_dreams_shop/features/order/data/models/address_model.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/address.dart';
import 'package:digital_dreams_shop/features/order/domain/repositories/address_repository.dart';

class AddressRepositoryImpl extends AddressRepository {
  final AddressRemoteDataSource remoteDataSource;

  const AddressRepositoryImpl(
    this.remoteDataSource,
  );

  @override
  ResultFuture<List<AddressModel>> getAllAddresses() async {
    try {
      final result = await remoteDataSource.getAllAddresses();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<AddressModel> getDefaultAddress() async {
    try {
      final result = await remoteDataSource.getDefaultAddress();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> addAddress(AddressModel address) async {
    try {
      await remoteDataSource.addAddress(address);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> deleteAddress(Address address) {
    // TODO: implement deleteAddress
    throw UnimplementedError();
  }
}
