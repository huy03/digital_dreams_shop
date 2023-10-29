import 'dart:convert';

import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.userName,
    required super.phoneNumber,
    required super.email,
    required super.password,
    required super.avatarUrl,
    required super.birthDate,
    required super.addresses,
  });

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel.fromMap(DataMap map)
      : this(
          id: map['id'],
          userName: map['userName'],
          phoneNumber: map['phoneNumber'],
          email: map['email'],
          password: map['password'],
          avatarUrl: map['avatarUrl'],
          birthDate: map['birthDate'] != null
              ? DateTime.parse(map['birthDate'])
              : null,
          addresses: map['addresses'] != null
              ? List<Object>.from(map['addresses'])
              : null,
        );

  DataMap toMap() => {
        'id': id,
        'userName': userName,
        'phoneNumber': phoneNumber,
        'email': email,
        'password': password,
        'avatarUrl': avatarUrl,
        'birthday': birthDate?.toIso8601String(),
        'addresses': addresses,
      };

  String toJson() => jsonEncode(toMap());

  User copyWith({
    String? id,
    String? userName,
    String? phoneNumber,
    String? email,
    String? password,
    String? avatarUrl,
    DateTime? birthDate,
    Gender? gender,
    List<Object>? addresses,
  }) {
    return User(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      birthDate: birthDate ?? this.birthDate,
      addresses: addresses ?? this.addresses,
    );
  }
}
