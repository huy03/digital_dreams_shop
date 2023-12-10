import 'package:bloc/bloc.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/address.dart';
import 'package:digital_dreams_shop/features/order/domain/usecases/address/get_default_address.dart';
import 'package:equatable/equatable.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final GetDefaultAddress getDefaultAddress;

  AddressCubit({required this.getDefaultAddress}) : super(AddressInitial());

  void fetchDefaultAddress() async {
    emit(AddressLoading());
    final result = await getDefaultAddress.call();
    result.fold(
      (failure) => emit(AddressFail(message: failure.errorMessage)),
      (address) {
        return emit(AddressLoaded(address: address));
      },
    );
  }
}
