import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final int phoneNumber;
  final String district;
  final String city;
  final String country;
  final String detailAddress;
  final bool isDefault;

  const Address({
    required this.phoneNumber,
    required this.district,
    required this.city,
    required this.country,
    required this.detailAddress,
    required this.isDefault,
  });

  @override
  List<Object?> get props => [
        phoneNumber,
        district,
        city,
        country,
      ];
}
