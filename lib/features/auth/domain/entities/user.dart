import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String userName;
  final String email;
  final String password;
  final String fullName;
  final String avatarUrl;
  final bool isActive;

  const User({
    required this.id,
    required this.userName,
    required this.email,
    required this.password,
    this.fullName = '',
    required this.avatarUrl,
    this.isActive = false,
  });

  @override
  List<Object?> get props => [
        id,
        userName,
        email,
        password,
        fullName,
        avatarUrl,
        isActive,
      ];
}
