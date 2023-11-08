import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final double regularPrice;
  final double? discountPrice;
  final List<String> colors;
  final String description;
  final int quantity;
  final String imageCover;
  final String brand;
  final double ratingAverage;
  final int ratingQuantity;
  final String categoryId;
  final String discountCoupon;

  const Product({
    required this.id,
    required this.name,
    required this.regularPrice,
    this.discountPrice,
    required this.colors,
    required this.description,
    required this.quantity,
    required this.imageCover,
    required this.brand,
    required this.ratingAverage,
    required this.ratingQuantity,
    required this.categoryId,
    required this.discountCoupon,
  });

  @override
  List<Object> get props => [id, name, regularPrice, description, imageCover];
}
