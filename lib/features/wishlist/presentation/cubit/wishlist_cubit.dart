import 'package:bloc/bloc.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/wishlist/domain/usecases/add_or_remove_product_from_wishlist.dart';
import 'package:digital_dreams_shop/features/wishlist/domain/usecases/get_wishlist.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final GetWishlist getWishlist;
  final AddOrRemoveProductFromWishlist addOrRemoveProductFromWishlist;

  WishlistCubit({
    required this.getWishlist,
    required this.addOrRemoveProductFromWishlist,
  }) : super(WishlistInitial());

  Future<void> fetchWishlist() async {
    emit(WishlistLoading());

    final result = await getWishlist.call();
    result.fold(
      (failure) => emit(
        WishlistFailure(message: failure.errorMessage),
      ),
      (products) => emit(
        WishlistSuccess(products: products),
      ),
    );
  }

  Future<void> addOrRemoveProduct(String id) async {
    emit(WishlistLoading());

    final result = await addOrRemoveProductFromWishlist.call(id);
    result.fold(
      (failure) => emit(
        WishlistFailure(message: failure.errorMessage),
      ),
      (products) => emit(
        WishlistSuccess(products: products),
      ),
    );
  }
}
