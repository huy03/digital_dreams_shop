part of 'address_cubit.dart';

sealed class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

final class AddressInitial extends AddressState {}

final class AddressLoading extends AddressState {}

final class AddressLoaded extends AddressState {
  const AddressLoaded({required this.address});

  final Address address;
}

final class AddressFail extends AddressState {
  const AddressFail({required this.message});

  final String message;
}
