import 'dart:convert';

import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/data/models/product_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource {
  const ProductRemoteDataSource();

  Future<List<ProductModel>> getAllProductsByCategory(String id);
  Future<List<ProductModel>> getProductById();
  Future<List<ProductModel>> getProductByName();
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  const ProductRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<List<ProductModel>> getAllProductsByCategory(String id) async {
    final url = Uri.parse('$kBaseUrl/categories/$id/products?sort=createdAt');
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    final DataMap data = jsonDecode(response.body);
    final List<ProductModel> products = [];
    if (response.statusCode == 200) {
      for (final product in data['data']['data']) {
        products.add(
          ProductModel.fromJson(product),
        );
      }

      return products;
    }

    if (products.isEmpty) {
      throw ServerException(
        'No products found',
        response.statusCode,
      );
    }

    throw ServerException(
      data['message'],
      response.statusCode,
    );
  }

  @override
  Future<List<ProductModel>> getProductById() {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getProductByName() {
    // TODO: implement getProductByName
    throw UnimplementedError();
  }
}
