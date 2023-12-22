import 'dart:convert';

import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/address.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/order_item.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';

class OrderItemModel extends OrderItem {
  const OrderItemModel({
    required super.id,
    required super.product,
    required super.price,
    required super.color,
    required super.quantity,
  });

  factory OrderItemModel.fromJson(String source) =>
      OrderItemModel.fromMap(jsonDecode(source) as DataMap);

  OrderItemModel.fromMap(DataMap map)
      : super(
          id: map['id'] as String,
          product: map['product'] as Product,
          price: map['price'] as int,
          quantity: map['quantity'] as int,
          color: map['color'] as String,
        );

  DataMap toMap() => {
        'product': product.id,
        'price': price,
        'quantity': quantity,
        'color': color,
      };

  String toJson() => jsonEncode(toMap());

  // OrderItemModel copyWith({
  //   String? id,
  //   String? customer,
  //   String? phoneNumber,
  //   String? detailedAddress,
  //   String? district,
  //   String? city,
  //   String? country,
  // }) {
  //   return OrderItemModel(
  //     id: id ?? this.id,
  //     customer: customer ?? this.customer,
  //     phoneNumber: phoneNumber ?? this.phoneNumber,
  //     detailedAddress: detailedAddress ?? this.detailedAddress,
  //     district: district ?? this.district,
  //     city: city ?? this.city,
  //     country: country ?? this.country,
  //   );
  // }
}
