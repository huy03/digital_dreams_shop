import 'dart:convert';

import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/home/data/models/coupon_model.dart';
import 'package:http/http.dart' as http;

abstract class CouponRemoteDataSource {
  const CouponRemoteDataSource();

  Future<List<CouponModel>> getAllCoupons();
}

class CouponRemoteDataSourceImpl extends CouponRemoteDataSource {
  const CouponRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<List<CouponModel>> getAllCoupons() async {
    final url = Uri.parse('$kBaseUrl/coupons');
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    final DataMap data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final List<CouponModel> coupons = [];
      for (final coupon in data['data']['data']) {
        coupons.add(
          CouponModel(
            id: coupon['_id'],
            code: coupon['code'],
            subtitle: coupon['subtitle'],
            discountValue: coupon['discountValue'],
            imageCover: coupon['imageCover'],
          ),
        );
      }

      return coupons;
    }
    throw ServerException(
      data['message'],
      response.statusCode,
    );
  }
}
