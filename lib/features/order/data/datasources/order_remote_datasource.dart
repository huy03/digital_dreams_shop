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
  Future<List<OrderModel>> getAllOrders(String query);
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
      throw ServerException(e.toString(), 500);
    }
  }

  @override
  Future<List<OrderModel>> getAllOrders(String query) async {
    final url = Uri.parse('$kBaseUrl/orders?$query');
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

      if (response.statusCode == 200) {
        return data['data']['data']
            .map<OrderModel>((e) => OrderModel.fromMap(e))
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
}
