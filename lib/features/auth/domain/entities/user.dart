import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:equatable/equatable.dart';

enum Gender { male, female }

class User extends Equatable {
  final String id;
  final String userName;
  final String phoneNumber;
  final String email;
  final String password;
  final String avatarUrl;
  final DateTime? birthDate;
  final Gender? gender;
  final List<Object>? addresses;

  const User({
    required this.id,
    required this.userName,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.avatarUrl,
    this.birthDate,
    this.gender,
    this.addresses,
  });

  @override
  List<Object?> get props => [
        id,
        userName,
        phoneNumber,
        email,
        password,
        avatarUrl,
        birthDate,
        gender,
      ];
}
