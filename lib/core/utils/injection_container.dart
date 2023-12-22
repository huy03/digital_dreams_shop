import 'package:digital_dreams_shop/core/network/network_info.dart';
import 'package:digital_dreams_shop/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:digital_dreams_shop/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:digital_dreams_shop/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:digital_dreams_shop/features/auth/domain/repositories/auth_repository.dart';
import 'package:digital_dreams_shop/features/auth/domain/usecases/log_in_with_email_and_password.dart';
import 'package:digital_dreams_shop/features/auth/domain/usecases/sign_up.dart';
import 'package:digital_dreams_shop/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:digital_dreams_shop/features/cart/data/datasources/cart_remote_datasource.dart';
import 'package:digital_dreams_shop/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:digital_dreams_shop/features/cart/domain/repositories/cart_repository.dart';
import 'package:digital_dreams_shop/features/cart/domain/usecases/add_to_cart.dart';
import 'package:digital_dreams_shop/features/cart/domain/usecases/decrease_cart_quantity.dart';
import 'package:digital_dreams_shop/features/cart/domain/usecases/empty_cart.dart';
import 'package:digital_dreams_shop/features/cart/domain/usecases/get_cart.dart';
import 'package:digital_dreams_shop/features/cart/domain/usecases/increase_cart_quantity.dart';
import 'package:digital_dreams_shop/features/cart/domain/usecases/remove_cart_item.dart';
import 'package:digital_dreams_shop/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:digital_dreams_shop/features/home/data/data_sources/coupon_remote_datasource.dart';
import 'package:digital_dreams_shop/features/home/data/repositories/coupon_repository_impl.dart';
import 'package:digital_dreams_shop/features/home/domain/repositories/coupon_respository.dart';
import 'package:digital_dreams_shop/features/home/domain/usecases/get_all_coupons.dart';
import 'package:digital_dreams_shop/features/home/presentation/cubit/coupon_cubit.dart';
import 'package:digital_dreams_shop/features/on_boarding/data/data_sources/on_boarding_local_data_sources.dart';
import 'package:digital_dreams_shop/features/on_boarding/data/repositories/on_boarding_repos_impl.dart';
import 'package:digital_dreams_shop/features/on_boarding/domain/repositories/on_boarding_repos.dart';
import 'package:digital_dreams_shop/features/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:digital_dreams_shop/features/on_boarding/domain/usecases/is_first_timer.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:digital_dreams_shop/features/order/data/datasources/address_remote_datasource.dart';
import 'package:digital_dreams_shop/features/order/data/repositories/address_repository_impl.dart';
import 'package:digital_dreams_shop/features/order/domain/repositories/address_repository.dart';
import 'package:digital_dreams_shop/features/order/domain/usecases/address/add_address.dart';
import 'package:digital_dreams_shop/features/order/domain/usecases/address/get_all_addresses.dart';
import 'package:digital_dreams_shop/features/order/domain/usecases/address/get_default_address.dart';
import 'package:digital_dreams_shop/features/order/presentation/cubit/address_cubit.dart';
import 'package:digital_dreams_shop/features/order/presentation/cubit/order_cubit.dart';
import 'package:digital_dreams_shop/features/products/data/datasources/category_remote_datasources.dart';
import 'package:digital_dreams_shop/features/products/data/datasources/product_remote_datasources.dart';
import 'package:digital_dreams_shop/features/products/data/repositories/category_repository_impl.dart';
import 'package:digital_dreams_shop/features/products/data/repositories/product_repository_impl.dart';
import 'package:digital_dreams_shop/features/products/domain/repositories/category_repository.dart';
import 'package:digital_dreams_shop/features/products/domain/repositories/product_repository.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/category/get_all_categories.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/category/get_popular_categories.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/product/get_all_products_by_category.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/product/get_new_arrivals_product.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/product/get_popular_products.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/product/get_product_by_Id.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/product/search_product_by_name.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/product/search_product_by_name_per_category.dart';
import 'package:digital_dreams_shop/features/products/presentation/bloc/products_bloc.dart';
import 'package:digital_dreams_shop/features/products/presentation/cubit/categories_cubit.dart';
import 'package:digital_dreams_shop/features/products/presentation/cubit/popular_categories_cubit.dart';
import 'package:digital_dreams_shop/features/profile/data/datasources/profile_remote_datasources.dart';
import 'package:digital_dreams_shop/features/profile/data/repository/profile_repository_impl.dart';
import 'package:digital_dreams_shop/features/profile/domain/repositories/profile_repository.dart';
import 'package:digital_dreams_shop/features/profile/domain/usecases/get_current_user.dart';
import 'package:digital_dreams_shop/features/profile/domain/usecases/update_current_user.dart';
import 'package:digital_dreams_shop/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:digital_dreams_shop/features/wishlist/data/datasources/wishlist_remote_datasource.dart';
import 'package:digital_dreams_shop/features/wishlist/data/repository/wishlist_repository_impl.dart';
import 'package:digital_dreams_shop/features/wishlist/domain/repository/wishlist_repository.dart';
import 'package:digital_dreams_shop/features/wishlist/domain/usecases/add_or_remove_product_from_wishlist.dart';
import 'package:digital_dreams_shop/features/wishlist/domain/usecases/get_wishlist.dart';
import 'package:digital_dreams_shop/features/wishlist/domain/usecases/remove_product_from_wishlist.dart';
import 'package:digital_dreams_shop/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - OnBoarding
  // Bloc
  sl.registerFactory(
      () => OnBoardingCubit(cacheFirstTimer: sl(), isFirstTimer: sl()));
  // Use cases
  sl.registerLazySingleton(() => CacheFirstTimer(sl()));
  sl.registerLazySingleton(() => IsFirstTimer(sl()));
  // Repository
  sl.registerLazySingleton<OnBoardingRepository>(
    () => OnBoardingRepositoryImpl(
      sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<OnBoardingLocalDataSource>(
    () => OnBoardingLocalDataSourceImpl(sl()),
  );

  //! Features - Auth
  //Bloc
  sl.registerFactory(
      () => AuthBloc(logInWithEmailAndPassword: sl(), signUp: sl()));
  // Use cases
  sl.registerLazySingleton(() => LogInWithEmailAndPassword(sl()));
  sl.registerLazySingleton(() => SignUp(sl()));
  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sl()));

  //! Features - Home
  // Cubit
  sl.registerFactory(() => CouponCubit(getAllCoupons: sl()));
  // Use cases
  sl.registerLazySingleton(() => GetAllCoupons(sl()));
  // Repository
  sl.registerLazySingleton<CouponRepository>(() => CouponRepositoryImpl(sl()));
  // Data sources
  sl.registerLazySingleton<CouponRemoteDataSource>(
      () => CouponRemoteDataSourceImpl(client: sl()));

  //! Features - Categories
  // Cubit
  sl.registerFactory(
    () => CategoriesCubit(
      getAllCategories: sl(),
    ),
  );
  sl.registerFactory(
    () => PopularCategoriesCubit(
      getPopularCategories: sl(),
    ),
  );
  // Use cases
  sl.registerLazySingleton(() => GetAllCategories(sl()));
  sl.registerLazySingleton(() => GetPopularCategories(sl()));
  // Repository
  sl.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(sl()));
  // Data sources
  sl.registerLazySingleton<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSourceImpl(client: sl()));

  //! Features - Products
  // Bloc
  sl.registerFactory(() => ProductsBloc(
        getAllProductsByCategory: sl(),
        getProductById: sl(),
        getNewArrivalProducts: sl(),
        getPopularProducts: sl(),
        searchProductsByName: sl(),
        searchProductsByNamePerCategory: sl(),
      ));
  // Use cases
  sl.registerLazySingleton(() => GetAllProductsByCategory(sl()));
  sl.registerLazySingleton(() => GetProductById(sl()));
  sl.registerLazySingleton(() => GetNewArrivalProducts(sl()));
  sl.registerLazySingleton(() => GetPopularProducts(sl()));
  sl.registerLazySingleton(() => SearchProductsByName(sl()));
  sl.registerLazySingleton(() => SearchProductsByNamePerCategory(sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(sl()));
  // Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(client: sl()));

  //! Wishlist
  // Cubit
  sl.registerFactory(
    () => WishlistCubit(
      getWishlist: sl(),
      addOrRemoveProductFromWishlist: sl(),
      removeProductFromWishlist: sl(),
    ),
  );
  // Use cases
  sl.registerLazySingleton(() => GetWishlist(sl()));
  sl.registerLazySingleton(() => AddOrRemoveProductFromWishlist(sl()));
  sl.registerLazySingleton(() => RemoveProductFromWishlist(sl()));
  // Repository
  sl.registerLazySingleton<WishlistRepository>(
      () => WishlistRepositoryImpl(sl()));
  // Data sources
  sl.registerLazySingleton<WishListRemoteDataSource>(
      () => WishlistRemoteDataSourceImpl(client: sl()));

  //! Profile
  // Cubit
  sl.registerFactory(
    () => ProfileCubit(
      getCurrentUser: sl(),
      updateCurrentUser: sl(),
    ),
  );
  // Use cases
  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  sl.registerLazySingleton(() => UpdateCurrentUser(sl()));
  // Repository
  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(sl()));
  // Data sources
  sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(client: sl()));

  //! Cart
  // Cubit
  sl.registerFactory(
    () => CartCubit(
      getCart: sl(),
      addToCart: sl(),
      increaseCartQuantity: sl(),
      decreaseCartQuantity: sl(),
      removeCartItem: sl(),
      emptyCart: sl(),
    ),
  );
  // Use cases
  sl.registerLazySingleton(() => GetCart(sl()));
  sl.registerLazySingleton(() => AddToCart(sl()));
  sl.registerLazySingleton(() => IncreaseCartQuantity(sl()));
  sl.registerLazySingleton(() => DecreaseCartQuantity(sl()));
  sl.registerLazySingleton(() => RemoveCartItem(sl()));
  sl.registerLazySingleton(() => EmptyCart(sl()));
  // Repository
  sl.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(sl()));
  // Data sources
  sl.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSourceImpl(client: sl()));

  //! Order
  // Cubit
  sl.registerFactory(
    () => AddressCubit(
      getDefaultAddress: sl(),
      getAllAddresses: sl(),
      addServerAddress: sl(),
    ),
  );
  sl.registerFactory(
    () => OrderCubit(),
  );
  // Use cases
  sl.registerLazySingleton(() => GetDefaultAddress(sl()));
  sl.registerLazySingleton(() => GetAllAddresses(sl()));
  sl.registerLazySingleton(() => AddAddress(sl()));
  // Repository
  sl.registerLazySingleton<AddressRepository>(
      () => AddressRepositoryImpl(sl()));
  // Data sources
  sl.registerLazySingleton<AddressRemoteDataSource>(
      () => AddressRemoteDataSourceImpl(client: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final preferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => preferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
}
