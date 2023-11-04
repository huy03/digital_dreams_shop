import 'package:digital_dreams_shop/core/network/network_info.dart';
import 'package:digital_dreams_shop/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:digital_dreams_shop/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:digital_dreams_shop/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:digital_dreams_shop/features/auth/domain/repositories/auth_repository.dart';
import 'package:digital_dreams_shop/features/auth/domain/usecases/log_in_with_email_and_password.dart';
import 'package:digital_dreams_shop/features/auth/domain/usecases/sign_up.dart';
import 'package:digital_dreams_shop/features/auth/presentation/bloc/auth_bloc.dart';
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
