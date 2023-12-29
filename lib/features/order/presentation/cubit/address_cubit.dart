import 'package:bloc/bloc.dart';
import 'package:digital_dreams_shop/features/order/data/models/address_model.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/address.dart';
import 'package:digital_dreams_shop/features/order/domain/usecases/address/add_address.dart';
import 'package:digital_dreams_shop/features/order/domain/usecases/address/get_all_addresses.dart';
import 'package:digital_dreams_shop/features/order/domain/usecases/address/get_default_address.dart';
import 'package:digital_dreams_shop/features/order/domain/usecases/address/update_address.dart';
import 'package:equatable/equatable.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final GetDefaultAddress getDefaultAddress;
  final GetAllAddresses getAllAddresses;
  final AddAddress addServerAddress;
  final UpdateAddress updateAddress;

  AddressCubit({
    required this.getDefaultAddress,
    required this.getAllAddresses,
    required this.addServerAddress,
    required this.updateAddress,
  }) : super(AddressInitial());

  void fetchAllAddresses() async {
    emit(AddressLoading());
    final result = await getAllAddresses.call();
    result.fold(
      (failure) => emit(AddressFail(message: failure.errorMessage)),
      (addresses) {
        return emit(AddressesLoaded(addresses: addresses));
      },
    );
  }

  void reOrderAddresses(int index) {
    final newState = state as AddressesLoaded;

    final updatedAddresses = newState.addresses;
    final item = updatedAddresses.removeAt(index);

    updatedAddresses.insert(0, item);

    emit(AddressesLoaded(addresses: updatedAddresses));
  }

  void addAddress(AddressModel address) {
    try {
      addServerAddress.call(address);
      final newState = state as AddressesLoaded;

      final updatedAddresses = newState.addresses;

      updatedAddresses.add(address);

      emit(AddressesLoaded(addresses: updatedAddresses));
    } catch (e) {
      emit(AddressFail(message: e.toString()));
    }
  }

  void updateAddressItem(AddressModel address) {
    updateAddress.call(address);
    final newState = state as AddressesLoaded;

    final updatedAddresses = newState.addresses;

    final index =
        updatedAddresses.indexWhere((element) => element.id == address.id);

    if (updatedAddresses[index].isDefault) {
      address.copyWith(isDefault: true);
    }

    updatedAddresses[index] = address;

    emit(AddressesLoaded(addresses: updatedAddresses));
  }
}
