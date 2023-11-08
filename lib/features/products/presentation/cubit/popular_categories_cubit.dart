import 'package:bloc/bloc.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/category.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/get_popular_categories.dart';
import 'package:equatable/equatable.dart';

part 'popular_categories_state.dart';

class PopularCategoriesCubit extends Cubit<PopularCategoriesState> {
  final GetPopularCategories getPopularCategories;
  PopularCategoriesCubit({required this.getPopularCategories})
      : super(PopularCategoriesInitial());

  Future<void> fetchPopularCategories() async {
    emit(PopularCategoriesLoading());
    final result = await getPopularCategories.call();
    result.fold(
      (failure) =>
          emit(PopularCategoriesFailure(message: failure.errorMessage)),
      (categories) => emit(PopularCategoriesSuccess(categories)),
    );
  }
}
