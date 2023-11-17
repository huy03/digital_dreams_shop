import 'dart:convert';

import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/utils/injection_container.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/data/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class WishListRemoteDataSource {
  const WishListRemoteDataSource();

  Future<List<ProductModel>> getWishlist();
  Future<List<ProductModel>> addOrRemoveProductFromWishlist(String id);
  Future<List<ProductModel>> removeProductFromWishlist(String id);
}

class WishlistRemoteDataSourceImpl extends WishListRemoteDataSource {
  const WishlistRemoteDataSourceImpl({required this.client});

  final http.Client client;
  @override
  Future<List<ProductModel>> getWishlist() async {
    final url = Uri.parse('$kBaseUrl/users/wishlist');
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
      //print(data['data']['wishlist']);
      final List<ProductModel> products = [];
      if (response.statusCode == 200) {
        for (final product in data['data']['wishlist']) {
          //print(product);
          products.add(
            ProductModel.fromJson(product),
          );
        }
        //print(products);
        return products;
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
  Future<List<ProductModel>> addOrRemoveProductFromWishlist(String id) async {
    final url = Uri.parse('$kBaseUrl/products/$id/wishlist');
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
      final List<ProductModel> products = [];
      if (response.statusCode == 200) {
        for (final product in data['data']['data']['wishlist']) {
          products.add(
            ProductModel.fromJson(product),
          );
        }
        return products;
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
  Future<List<ProductModel>> removeProductFromWishlist(String id) async {
    final url = Uri.parse('$kBaseUrl/products/$id/deleteFromWishlist');
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
      final List<ProductModel> products = [];
      if (response.statusCode == 200) {
        for (final product in data['data']['data']['wishlist']) {
          products.add(
            ProductModel.fromJson(product),
          );
        }
        return products;
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
