import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String productName;
  final double price;
  final String color;
  final String description;
  final String categoryId;
  final String brand;
  final String discountCoupon;

  const Product({
    required this.id,
    required this.productName,
    required this.price,
    required this.color,
    required this.description,
    required this.categoryId,
    required this.brand,
    required this.discountCoupon,
  });

  @override
  List<Object> get props => [id, productName, price, color];
}
