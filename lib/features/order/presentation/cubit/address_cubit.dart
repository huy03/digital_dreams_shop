import 'package:bloc/bloc.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/address.dart';
import 'package:digital_dreams_shop/features/order/domain/usecases/address/get_all_addresses.dart';
import 'package:digital_dreams_shop/features/order/domain/usecases/address/get_default_address.dart';
import 'package:equatable/equatable.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final GetDefaultAddress getDefaultAddress;
  final GetAllAddresses getAllAddresses;

  AddressCubit({
    required this.getDefaultAddress,
    required this.getAllAddresses,
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

    final item = newState.addresses.removeAt(index);

    newState.addresses.insert(0, item);
    final updatedAddresses = newState.addresses;

    emit(AddressesLoaded(addresses: updatedAddresses));
  }

  // void fetchDefaultAddress() async {
  //   emit(AddressLoading());
  //   final result = await getDefaultAddress.call();
  //   result.fold(
  //     (failure) => emit(AddressFail(message: failure.errorMessage)),
  //     (address) {
  //       return emit(AddressLoaded(address: address));
  //     },
  //   );
  // }
}
