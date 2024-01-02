import 'dart:convert';

import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/utils/injection_container.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/cart/data/models/cart_model.dart';
import 'package:digital_dreams_shop/features/cart/domain/entities/cart_item_entity.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class CartRemoteDataSource {
  const CartRemoteDataSource();

  Future<CartModel> getCart();

  Future<void> addToCart({
    required Product product,
    required int quantity,
    required String color,
  });

  Future<void> increaseCartQuantity({
    required Product product,
  });

  Future<void> decreaseCartQuantity({
    required Product product,
  });

  Future<void> removeCartItem({
    required String productId,
  });

  Future<void> emptyCart();
}

class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  const CartRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<CartModel> getCart() async {
    final url = Uri.parse('$kBaseUrl/carts');
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
        return CartModel(
          id: DateTime.now().toString(),
          items: <CartItemEntity>[],
          cartTotalPrice: 0,
          cartTotalQuantity: 0,
        );
      }

      if (response.statusCode == 200) {
        return CartModel.fromJson(data['data']['data'][0]);
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
  Future<void> addToCart(
      {required Product product,
      required int quantity,
      required String color}) async {
    final url = Uri.parse('$kBaseUrl/carts');
    try {
      final response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${sl<SharedPreferences>().getString(kAuthToken)}',
        },
        body: jsonEncode({
          'product': product.id,
          'quantity': quantity,
          'color': color,
        }),
      );
      final DataMap data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return;
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
  Future<void> decreaseCartQuantity({required Product product}) async {
    final url = Uri.parse('$kBaseUrl/carts/increase');
    try {
      final response = await client.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${sl<SharedPreferences>().getString(kAuthToken)}',
        },
        body: jsonEncode({
          'product': product.id,
        }),
      );
      final DataMap data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return;
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
  Future<void> increaseCartQuantity({required Product product}) async {
    final url = Uri.parse('$kBaseUrl/carts/decrease');
    try {
      final response = await client.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${sl<SharedPreferences>().getString(kAuthToken)}',
        },
        body: jsonEncode({
          'product': product.id,
        }),
      );
      final DataMap data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return;
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
  Future<void> removeCartItem({required String productId}) async {
    final url = Uri.parse('$kBaseUrl/carts/delete');
    try {
      final response = await client.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${sl<SharedPreferences>().getString(kAuthToken)}',
        },
        body: jsonEncode({
          'product': productId,
        }),
      );
      final DataMap data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return;
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
  Future<void> emptyCart() async {
    final url = Uri.parse('$kBaseUrl/carts/empty');
    try {
      final response = await client.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${sl<SharedPreferences>().getString(kAuthToken)}',
        },
      );
      final DataMap data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return;
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
