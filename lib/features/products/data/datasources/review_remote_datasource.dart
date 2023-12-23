import 'dart:convert';

import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/utils/injection_container.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/data/models/category_model.dart';
import 'package:digital_dreams_shop/features/products/data/models/review_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class ReviewRemoteDataSource {
  const ReviewRemoteDataSource();

  Future<List<ReviewModel>> getProductReviews(String productId);
}

class ReviewRemoteDataSourceImpl extends ReviewRemoteDataSource {
  const ReviewRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<List<ReviewModel>> getProductReviews(String productId) async {
    final url = Uri.parse('$kBaseUrl/products/$productId/reviews');
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
      final List<ReviewModel> reviews = [];
      for (final review in data['data']['data']) {
        reviews.add(
          ReviewModel(
            id: review['id'],
            comment: review['comment'],
            rating: (review['rating'] as num).toDouble(),
            user: review['author']['username'],
            product: review['product'],
          ),
        );
      }

      return reviews;
    }
    throw ServerException(
      data['message'],
      response.statusCode,
    );
  }
}
