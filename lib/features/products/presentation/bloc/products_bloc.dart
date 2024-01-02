import 'package:bloc/bloc.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/product/get_all_products_by_category.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/product/get_new_arrivals_product.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/product/get_popular_products.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/product/get_products_by_brand_per_category.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/product/get_relevent_products.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/product/search_product_by_name.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/product/search_product_by_name_per_category.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/product/get_product_by_id.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetAllProductsByCategory getAllProductsByCategory;
  final GetProductById getProductById;
  final GetNewArrivalProducts getNewArrivalProducts;
  final GetPopularProducts getPopularProducts;
  final SearchProductsByName searchProductsByName;
  final SearchProductsByNamePerCategory searchProductsByNamePerCategory;
  final GetProductsByBrandPerCategory getProductsByBrandPerCategory;
  final GetRelevantProducts getRelevantProducts;

  ProductsBloc({
    required this.getAllProductsByCategory,
    required this.getProductById,
    required this.getNewArrivalProducts,
    required this.getPopularProducts,
    required this.searchProductsByName,
    required this.searchProductsByNamePerCategory,
    required this.getRelevantProducts,
    required this.getProductsByBrandPerCategory,
  }) : super(ProductsInitial()) {
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

    on<GetNewArrivalProductsEvent>((event, emit) async {
      emit(ProductsLoading());
      final result = await getNewArrivalProducts.call();

      result.fold(
        (failure) => emit(ProductsError(failure.errorMessage)),
        (products) => emit(
          NewArrivalProductsSuccess(products: products),
        ),
      );
    });

    on<GetPopularProductsEvent>((event, emit) async {
      emit(ProductsLoading());
      final result = await getPopularProducts.call();

      result.fold(
        (failure) => emit(ProductsError(failure.errorMessage)),
        (products) => emit(
          PopularProductsSuccess(products: products),
        ),
      );
    });

    on<SearchProductsByNameEvent>((event, emit) async {
      emit(ProductsLoading());
      final result = await searchProductsByName.call(event.text);

      result.fold(
        (failure) => emit(ProductsError(failure.errorMessage)),
        (products) => emit(
          SearchProductsSuccess(products: products),
        ),
      );
    });

    on<SearchProductsByNamePerCategoryEvent>((event, emit) async {
      emit(ProductsLoading());
      final result = await searchProductsByNamePerCategory.call(
        SearchProductsByNamePerCategoryParams(
          id: event.id,
          text: event.text,
        ),
      );

      result.fold(
        (failure) => emit(ProductsError(failure.errorMessage)),
        (products) => emit(
          SearchProductsPerCategorySuccess(products: products),
        ),
      );
    });

    on<GetProductsByBrandPerCategoryEvent>((event, emit) async {
      emit(ProductsLoading());
      final result = await getProductsByBrandPerCategory.call(
        GetProductsByBrandPerCategoryParams(
          id: event.id,
          brand: event.brand,
          search: event.search,
        ),
      );

      result.fold(
        (failure) => emit(ProductsError(failure.errorMessage)),
        (products) => emit(
          GetProductsByBrandPerCategorySuccess(products: products),
        ),
      );
    });

    on<GetRelevantProductsEvent>((event, emit) async {
      emit(ProductsLoading());
      final result = await getRelevantProducts.call(
        RelevantProductParams(
          categoryId: event.categoryId,
          productId: event.productId,
        ),
      );

      result.fold(
        (failure) => emit(ProductsError(failure.errorMessage)),
        (products) => emit(
          RelevantProductsSuccess(products: products),
        ),
      );
    });
  }
}
