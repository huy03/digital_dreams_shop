import 'package:bloc/bloc.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/order_item.dart';

part 'product_rate_state.dart';

class ProductRateCubit extends Cubit<ProductRateState> {
  ProductRateCubit() : super(const ProductRateState());

  void addRateProduct(List<OrderItem> items) {
    emit(
      state.copyWith(
        rateProducts: [...items],
      ),
    );
  }

  void removeRateProduct(OrderItem item) {
    emit(
      state.copyWith(
        rateProducts: [
          ...state.rateProducts.where((element) => element != item),
        ],
      ),
    );
  }
}
