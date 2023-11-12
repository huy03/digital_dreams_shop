import 'package:digital_dreams_shop/core/network/network_info.dart';
import 'package:digital_dreams_shop/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:digital_dreams_shop/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:digital_dreams_shop/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:digital_dreams_shop/features/auth/domain/repositories/auth_repository.dart';
import 'package:digital_dreams_shop/features/auth/domain/usecases/log_in_with_email_and_password.dart';
import 'package:digital_dreams_shop/features/auth/domain/usecases/sign_up.dart';
import 'package:digital_dreams_shop/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:digital_dreams_shop/features/home/data/data_sources/coupon_remote_datasource.dart';
import 'package:digital_dreams_shop/features/home/data/repositories/coupon_repository_impl.dart';
import 'package:digital_dreams_shop/features/home/domain/repositories/coupon_respository.dart';
import 'package:digital_dreams_shop/features/home/domain/usecases/get_all_coupons.dart';
import 'package:digital_dreams_shop/features/home/presentation/cubit/coupon_cubit.dart';
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
import 'package:digital_dreams_shop/features/products/presentation/bloc/products_bloc.dart';
import 'package:digital_dreams_shop/features/products/presentation/cubit/categories_cubit.dart';
import 'package:digital_dreams_shop/features/products/presentation/cubit/popular_categories_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
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
      ));
  // Use cases
  sl.registerLazySingleton(() => GetAllProductsByCategory(sl()));
  sl.registerLazySingleton(() => GetProductById(sl()));
  sl.registerLazySingleton(() => GetNewArrivalProducts(sl()));
  sl.registerLazySingleton(() => GetPopularProducts(sl()));
  // Repository
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(sl()));
  // Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(client: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final preferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => preferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());

  // Use cases
  // sl.registerLazySingleton(() => LogInWithEmailAndPassword(sl()));
  // sl.registerLazySingleton(() => LogInWithFacebook(sl()));
  // sl.registerLazySingleton(() => LogInWithGoogle(sl()));
  // sl.registerLazySingleton(() => SignUp(sl()));
  // sl.registerLazySingleton(() => ForgotPassword(sl()));
  // sl.registerLazySingleton(() => UpdateUser(sl()));
  // sl.registerLazySingleton(() => SignOut(sl()));
  // sl.registerLazySingleton(() => GetUser(sl()));

  // Repository
  // sl.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(
  //     sl(),
  //   ),
  // );

  // Data sources
  // sl.registerLazySingleton<AuthRemoteDataSource>(
  //   () => AuthRemoteDataSourceImpl(
  //     firebaseAuth: sl(),
  //     googleSignIn: sl(),
  //     facebookLogin: sl(),
  //   ),
  // );

  // Core
  // sl.registerLazySingleton(() => InputConverter());
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  // sl.registerLazySingleton(() => FirebaseAuth.instance);
  // sl.registerLazySingleton(() => GoogleSignIn());
  // sl.registerLazySingleton(() => FacebookLogin());
  // sl.registerLazySingleton(() => Connectivity());
  // sl.registerLazySingleton(() => DataConnectionChecker());
}
