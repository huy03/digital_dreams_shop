import 'package:equatable/equatable.dart';

enum Gender { male, female }

class User extends Equatable {
  final String id;
  final String userName;
  final String phoneNumber;
  final String email;
  final String? password;
  final String? avatar;
  final DateTime? birthDate;
  final String? token;

  const User({
    required this.id,
    required this.userName,
    required this.phoneNumber,
    required this.email,
    this.password,
    this.avatar = '',
    this.birthDate,
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
