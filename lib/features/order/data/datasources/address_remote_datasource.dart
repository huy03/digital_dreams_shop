import 'dart:convert';

import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/utils/injection_container.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/order/data/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class AddressRemoteDataSource {
  const AddressRemoteDataSource();

  Future<List<AddressModel>> getAllAddresses();
  Future<AddressModel> getDefaultAddress();
}

class AddressRemoteDataSourceImpl extends AddressRemoteDataSource {
  const AddressRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<List<AddressModel>> getAllAddresses() async {
    final url = Uri.parse('$kBaseUrl/addresses?sort=createdAt');
    try {
      final response = await client.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${sl<SharedPreferences>().getString(kAuthToken)}',
        },
      );
      final DataMap data = jsonDecode(response.body);

      if (data['data']['data'].isEmpty) {
        throw const ServerException('No address', 404);
      }

      if (response.statusCode == 200) {
        return data['data']['data']
            .map<AddressModel>((e) => AddressModel.fromMap(e))
            .toList();
      }

      throw ServerException(
        data['message'],
        response.statusCode,
      );
    } catch (e) {
      throw ServerException(e.toString(), 500);
    }
  }

  @override
  Future<AddressModel> getDefaultAddress() async {
    final url = Uri.parse('$kBaseUrl/addresses?isDefault=true');
    try {
      final response = await client.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${sl<SharedPreferences>().getString(kAuthToken)}',
        },
      );
      final DataMap data = jsonDecode(response.body);

      if (data['data']['data'].isEmpty) {
        throw const ServerException('No default address', 404);
      }

      if (response.statusCode == 200) {
        return AddressModel.fromMap(data['data']['data'][0]);
      }

      throw ServerException(
        data['message'],
        response.statusCode,
      );
    } catch (e) {
      throw ServerException(e.toString(), 500);
    }
  }
}
