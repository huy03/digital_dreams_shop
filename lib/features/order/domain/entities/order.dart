import 'package:digital_dreams_shop/features/order/data/models/address_model.dart';
import 'package:digital_dreams_shop/features/order/data/models/order_item_model.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/order_item.dart';
import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String? id;
  final AddressModel shippingAddress;
  final String? user;
  final List<OrderItemModel> items;
  final int? totalQuantity;
  final int? totalPrice;
  final String paymentMethod;
  final int shippingPrice;
  final String? orderStatus;

  const OrderEntity({
    this.id,
    this.user,
    required this.shippingAddress,
    required this.items,
    this.totalQuantity,
    this.totalPrice,
    required this.paymentMethod,
    required this.shippingPrice,
    this.orderStatus,
  });

  @override
  List<Object> get props => [];
}
