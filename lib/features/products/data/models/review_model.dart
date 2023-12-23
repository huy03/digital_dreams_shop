import 'dart:convert';

import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/review.dart';

class ReviewModel extends Review {
  const ReviewModel({
    required super.id,
    required super.user,
    required super.product,
    required super.comment,
    required super.rating,
  });

  factory ReviewModel.fromJson(String source) =>
      ReviewModel.fromMap(jsonDecode(source) as DataMap);

  ReviewModel.fromMap(DataMap map)
      : super(
          id: map['id'] as String,
          comment: map['comment'] as String,
          rating: map['rating'] as double,
          user: map['author'].username as String,
          product: map['product'] as String,
        );

  DataMap toMap() => {
        'comment': comment,
        'rating': rating,
      };

  String toJson() => jsonEncode(toMap());

  ReviewModel copyWith({
    String? id,
    String? comment,
    double? rating,
    String? product,
    String? user,
  }) {
    return ReviewModel(
      id: id ?? this.id,
      comment: comment ?? this.comment,
      rating: rating ?? this.rating,
      product: product ?? this.product,
      user: user ?? this.user,
    );
  }
}
