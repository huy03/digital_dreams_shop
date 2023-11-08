import 'dart:convert';

import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/data/models/category_model.dart';
import 'package:http/http.dart' as http;

abstract class CategoryRemoteDataSource {
  const CategoryRemoteDataSource();

  Future<List<CategoryModel>> getAllCategories();
  Future<List<CategoryModel>> getPopularCategories();
}

class CategoryRemoteDataSourceImpl extends CategoryRemoteDataSource {
  const CategoryRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final url = Uri.parse('$kBaseUrl/categories?sort=createdAt');
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    final DataMap data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final List<CategoryModel> categories = [];
      for (final category in data['data']['data']) {
        categories.add(
          CategoryModel(
            id: category['_id'],
            name: category['name'],
            productCount: category['productCount'],
            image: category['image'],
          ),
        );
      }

      return categories;
    }
    throw ServerException(
      data['message'],
      response.statusCode,
    );
  }

  @override
  Future<List<CategoryModel>> getPopularCategories() async {
    final url = Uri.parse('$kBaseUrl/categories?limit=3&sort=-updatedAt');
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    final DataMap data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final List<CategoryModel> categories = [];
      for (final category in data['data']['data']) {
        categories.add(
          CategoryModel(
            id: category['_id'],
            name: category['name'],
            productCount: category['productCount'],
            image: category['image'],
          ),
        );
      }

      return categories;
    }
    throw ServerException(
      data['message'],
      response.statusCode,
    );
  }
}
