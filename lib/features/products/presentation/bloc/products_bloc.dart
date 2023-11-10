import 'package:bloc/bloc.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/product/get_all_products_by_category.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetAllProductsByCategory getAllProductsByCategory;

  ProductsBloc({required this.getAllProductsByCategory})
      : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetAllProductsByCategoryEvent>((event, emit) async {
      emit(ProductsLoading());
      final result =
          await getAllProductsByCategory.call(CategoryParams(id: event.id));

      result.fold(
        (failure) => emit(ProductsError(failure.errorMessage)),
        (products) => emit(
          ProductsSuccess(products: products),
        ),
      );
    });
  }
}
