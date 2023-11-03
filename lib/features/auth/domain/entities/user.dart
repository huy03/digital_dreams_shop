import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/auth/domain/entities/address.dart';
import 'package:equatable/equatable.dart';

enum Gender { male, female }

class User extends Equatable {
  final String id;
  final String userName;
  final String phoneNumber;
  final String email;
  final String password;
  final String? avatarUrl;
  final DateTime? birthDate;
  final List<Address>? addresses;
  final String? token;

  const User({
    required this.id,
    required this.userName,
    required this.phoneNumber,
    required this.email,
    required this.password,
    this.avatarUrl = '',
    this.birthDate,
    this.addresses,
    this.token,
  });

  @override
  List<Object?> get props => [
        id,
        userName,
        phoneNumber,
        email,
      ];
}
