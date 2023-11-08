import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.productCount,
    required super.image,
  });

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(jsonDecode(source) as DataMap);

  CategoryModel.fromMap(DataMap map)
      : super(
          id: map['data']['data']['_id'] as String,
          name: map['data']['data']['name'] as String,
          productCount: map['data']['data']['productCount'] as int,
          image: map['data']['data']['image'] as String,
        );

  DataMap toMap() => {
        '_id': id,
        'name': name,
        'productCount': productCount,
        'image': image,
      };

  String toJson() => jsonEncode(toMap());

  CategoryModel copyWith({
    String? id,
    String? name,
    int? productCount,
    String? image,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      productCount: productCount ?? this.productCount,
      image: image ?? this.image,
    );
  }
}
