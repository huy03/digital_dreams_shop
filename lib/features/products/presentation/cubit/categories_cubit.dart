import 'package:bloc/bloc.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/category.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/get_all_categories.dart';
import 'package:equatable/equatable.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetAllCategories getAllCategories;

  CategoriesCubit({
    required this.getAllCategories,
  }) : super(CategoriesInitial());

  Future<void> fetchAllCategories() async {
    emit(CategoriesLoading());
    final result = await getAllCategories.call();
    result.fold(
      (failure) => emit(CategoriesFailure(message: failure.errorMessage)),
      (categories) => emit(CategoriesSuccess(categories)),
    );
  }
}
