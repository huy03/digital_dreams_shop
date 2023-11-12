import 'dart:convert';

import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();

  Future<UserModel> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signUp({
    required String email,
    required String password,
    required String username,
    required String phoneNumber,
  });

  // Future<void> logInWithGoogle();

  // Future<void> logInWithFacebook();

  // Future<void> forgotPassword(String email);

  // Future<void> updateUser({
  //   required UserInfo userInfo,
  //   dynamic userData,
  // });

  // Future<void> signOut();

  // Future<String> getUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<UserModel> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$kBaseUrl/users/login');
    final response = await client.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': email,
        'password': password,
      }),
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
  Future<void> signUp({
    required String email,
    required String password,
    required String username,
    required String phoneNumber,
  }) async {
    final url = Uri.parse('$kBaseUrl/users/signup');
    final response = await client.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'username': username,
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
      }),
    );

    final DataMap data = jsonDecode(response.body);
    if (data['status'] == 'fail') {
      throw ServerException(
        data['message'],
        response.statusCode,
      );
    }
  }

  // Future<void> logInWithFacebook() async {}

  // Future<String> getUser() {
  //   // TODO: implement getUser
  //   throw UnimplementedError();
  // }

  // Future<void> logInWithGoogle() {
  //   // TODO: implement logInWithGoogle
  //   throw UnimplementedError();
  // }

  // Future<void> signOut() {
  //   // TODO: implement signOut
  //   throw UnimplementedError();
  // }

  // Future<void> forgotPassword(String email) {
  //   // TODO: implement forgotPassword
  //   throw UnimplementedError();
  // }

  // Future<void> updateUser({required UserInfo userInfo, userData}) {
  //   // TODO: implement updateUser
  //   throw UnimplementedError();
  // }
}
