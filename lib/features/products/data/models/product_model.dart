import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.regularPrice,
    super.colors,
    required super.description,
    required super.quantity,
    required super.imageCover,
    required super.brand,
    required super.ratingsAverage,
    required super.ratingsQuantity,
    required super.category,
    required super.categoryId,
    super.discountCoupon,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['_id'] as String,
        name: json['name'] as String,
        regularPrice: json['regularPrice'] as int,
        description: json['description'] as String,
        quantity: json['quantity'] as int,
        imageCover: json['imageCover'] as String,
        brand: json['brand'] as String,
        ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
        ratingsQuantity: (json['ratingsQuantity'] as num).toInt(),
        category: json['category']['name'] as String,
        categoryId: json['category']['id'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'regularPrice': regularPrice,
        'colors': colors,
        'description': description,
        'quantity': quantity,
        'imageCover': imageCover,
        'brand': brand,
        'ratingAverage': ratingsAverage,
        'ratingQuantity': ratingsQuantity,
        'category': category,
      };
}
