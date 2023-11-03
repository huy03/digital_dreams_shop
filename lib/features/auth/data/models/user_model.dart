import 'dart:convert';

import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/auth/domain/entities/address.dart';
import 'package:digital_dreams_shop/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.userName,
    required super.phoneNumber,
    required super.email,
    required super.password,
    super.avatarUrl,
    super.birthDate,
    super.addresses,
    super.token,
  });

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel.fromMap(DataMap map)
      : super(
          id: map['data']['user']['_id'] as String,
          userName: map['data']['user']['username'] as String,
          phoneNumber: map['data']['user']['phoneNumber'] as String,
          email: map['data']['user']['email'] as String,
          password: map['data']['user']['password'] as String,
          // avatarUrl: map['data']['user']['avatarUrl'] as String?,
          // birthDate: map['data']['user']['birthDate'] as DateTime?,
          // addresses: (map['data']['user']['addresses'] as List<dynamic>)
          //     .cast<Address>(),
          token: map['data']['token'] as String?,
        );

  DataMap toMap() => {
        '_id': id,
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
    List<Address>? addresses,
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
