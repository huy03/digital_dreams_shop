import 'dart:convert';

import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/home/domain/entities/coupon.dart';

class CouponModel extends Coupon {
  CouponModel({
    required super.id,
    required super.code,
    required super.discountValue,
    required super.imageCover,
    required super.subtitle,
  });

  factory CouponModel.fromJson(String source) =>
      CouponModel.fromMap(jsonDecode(source) as DataMap);

  CouponModel.fromMap(DataMap map)
      : super(
          id: map['data']['data']['_id'] as String,
          code: map['data']['data']['code'] as String,
          subtitle: map['data']['data']['subtitle'] as String,
          discountValue: map['data']['data']['discountValue'] as int,
          imageCover: map['data']['data']['imageCover'] as String,
        );

  DataMap toMap() => {
        '_id': id,
        'code': code,
        'subtitle': subtitle,
        'discountValue': discountValue,
        'imageCover': imageCover,
      };

  String toJson() => jsonEncode(toMap());

  Coupon copyWith({
    String? id,
    String? code,
    String? subtitle,
    int? discountValue,
    String? imageCover,
  }) {
    return Coupon(
      id: id ?? this.id,
      code: code ?? this.code,
      subtitle: subtitle ?? this.subtitle,
      discountValue: discountValue ?? this.discountValue,
      imageCover: imageCover ?? this.imageCover,
    );
  }
}
