part of 'product_rate_cubit.dart';

enum ProductRateStatus { initial, loading, loaded, error }

class ProductRateState {
  const ProductRateState({
    this.status = ProductRateStatus.initial,
    this.rateProducts = const [],
    this.errorMessage = '',
  });

  final ProductRateStatus status;
  final List<OrderItem> rateProducts;
  final String errorMessage;

  ProductRateState copyWith({
    ProductRateStatus? status,
    List<OrderItem>? rateProducts,
    String? errorMessage,
  }) {
    return ProductRateState(
      status: status ?? this.status,
      rateProducts: rateProducts ?? this.rateProducts,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
