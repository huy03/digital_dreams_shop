import 'dart:convert';

import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/order.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/order_item.dart';

class OrderModel extends Order {
  const OrderModel({
    required super.id,
    required super.items,
    required super.shippingAddress,
    required super.user,
    required super.orderStatus,
    required super.paymentMethod,
    required super.shippingPrice,
    required super.totalPrice,
    required super.totalQuantity,
  });

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(jsonDecode(source) as DataMap);

  OrderModel.fromMap(DataMap map)
      : super(
          id: map['id'] as String,
          items: map['items'] as List<OrderItem>,
          shippingAddress: map['shippingAddress'] as Map<String, String>,
          user: map['user'] as String,
          orderStatus: map['orderStatus'] as String,
          paymentMethod: map['paymentMethod'] as String,
          shippingPrice: map['shippingPrice'] as int,
          totalPrice: map['totalPrice'] as int,
          totalQuantity: map['totalQuantity'] as int,
        );

  DataMap toMap() => {
        'items': items,
        'shippingAddress': shippingAddress,
        'paymentMethod': paymentMethod,
        'shippingPrice': shippingPrice,
      };

  String toJson() => jsonEncode(toMap());

  OrderModel copyWith({
    String? id,
    List<OrderItem>? items,
    Map<String, String>? shippingAddress,
    String? orderStatus,
    String? paymentMethod,
    String? user,
    int? shippingPrice,
    int? totalPrice,
    int? totalQuantity,
  }) {
    return OrderModel(
      id: id ?? this.id,
      items: items ?? this.items,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      orderStatus: orderStatus ?? this.orderStatus,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      user: user ?? this.user,
      shippingPrice: shippingPrice ?? this.shippingPrice,
      totalPrice: totalPrice ?? this.totalPrice,
      totalQuantity: totalQuantity ?? this.totalQuantity,
    );
  }
}
