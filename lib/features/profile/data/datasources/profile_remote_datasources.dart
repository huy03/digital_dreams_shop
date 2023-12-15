import 'dart:convert';

import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/utils/injection_container.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProfileRemoteDataSource {
  const ProfileRemoteDataSource();

  Future<UserModel> getCurrentUser();
  Future<UserModel> updateProfile({
    required String username,
    required String email,
    required String phoneNumber,
    required String gender,
    required String birthday,
  });
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  const ProfileRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<UserModel> getCurrentUser() async {
    final url = Uri.parse('$kBaseUrl/users/me');
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer ${sl<SharedPreferences>().getString(kAuthToken)}',
      },
    );
    final DataMap data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.body);
    }

    throw ServerException(
      data['message'],
      response.statusCode,
    );
  }

  @override
  Future<UserModel> updateProfile({
    required String username,
    required String email,
    required String phoneNumber,
    required String gender,
    required String birthday,
  }) async {
    final url = Uri.parse('$kBaseUrl/users/updateMe');
    final response = await client.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer ${sl<SharedPreferences>().getString(kAuthToken)}',
      },
      body: json.encode({
        'username': username,
        'email': email,
        'phoneNumber': phoneNumber,
        'gender': gender.toUpperCase(),
        'birthday': birthday,
      }),
    );

    final DataMap data = jsonDecode(response.body);
    if (data['status'] == 'fail') {
      throw ServerException(
        data['message'],
        response.statusCode,
      );
    }

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.body);
    }

    throw ServerException(
      data['message'],
      response.statusCode,
    );
  }
}
