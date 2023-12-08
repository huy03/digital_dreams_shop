import 'dart:convert';

import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.userName,
    required super.phoneNumber,
    required super.email,
    super.password,
    super.avatar,
    super.birthDate,
    super.token,
  });

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel.fromMap(DataMap map)
      : super(
          id: map['data']['data']['_id'] as String,
          userName: map['data']['data']['username'] as String,
          phoneNumber: map['data']['data']['phoneNumber'] as String,
          email: map['data']['data']['email'] as String,
          password: map['data']['data']['password'] == null
              ? ''
              : (map['data']['data']['password'] as String),
          avatar: map['data']['data']['avatar'] as String?,
          // birthDate: map['data']['user']['birthDate'] as DateTime?,
          token: map['token'] as String?,
        );

  DataMap toMap() => {
        '_id': id,
        'userName': userName,
        'phoneNumber': phoneNumber,
        'email': email,
        'password': password,
        'avatar': avatar,
        'birthday': birthDate?.toIso8601String(),
      };

  String toJson() => jsonEncode(toMap());

  User copyWith({
    String? id,
    String? userName,
    String? phoneNumber,
    String? email,
    String? password,
    String? avatar,
    DateTime? birthDate,
  }) {
    return User(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      avatar: avatar ?? this.avatar,
      birthDate: birthDate ?? this.birthDate,
    );
  }
}
