import 'dart:convert';

import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/utils/injection_container.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/order/data/models/order_model.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class OrderRemoteDataSource {
  const OrderRemoteDataSource();

  Future<void> placeOrder(OrderModel order);
}

class OrderRemoteDataSourceImpl extends OrderRemoteDataSource {
  const OrderRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<void> placeOrder(OrderModel order) async {
    final url = Uri.parse('$kBaseUrl/orders');
    try {
      final response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${sl<SharedPreferences>().getString(kAuthToken)}',
        },
        body: order.toJson(),
      );

      if (response.statusCode == 200) {
        return;
      }
    } catch (e) {
      print(e);
      throw ServerException(e.toString(), 500);
    }
  }
}
