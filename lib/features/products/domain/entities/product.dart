import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.productName,
    required this.price,
    required this.color,
  });

  final String id;
  final String productName;
  final double price;
  final String color;

  @override
  List<Object> get props => [id, productName, price, color];
}
