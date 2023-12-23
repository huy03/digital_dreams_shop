import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final int regularPrice;
  final double? discountPrice;
  final List<String>? colors;
  final String description;
  final int quantity;
  final String imageCover;
  final String brand;
  final double ratingsAverage;
  final int ratingsQuantity;
  final String category;
  final String categoryId;
  final String? discountCoupon;

  const Product({
    required this.id,
    required this.name,
    required this.regularPrice,
    this.discountPrice,
    this.colors,
    required this.description,
    required this.quantity,
    required this.imageCover,
    required this.brand,
    required this.ratingsAverage,
    required this.ratingsQuantity,
    required this.category,
    required this.categoryId,
    this.discountCoupon,
  });

  @override
  List<Object> get props => [id, name, regularPrice, description, imageCover];
}
