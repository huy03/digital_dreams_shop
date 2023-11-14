import 'package:digital_dreams_shop/core/utils/injection_container.dart';
import 'package:digital_dreams_shop/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/features/home/presentation/cubit/coupon_cubit.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:digital_dreams_shop/features/products/presentation/bloc/products_bloc.dart';
import 'package:digital_dreams_shop/features/products/presentation/cubit/categories_cubit.dart';
import 'package:digital_dreams_shop/features/products/presentation/cubit/popular_categories_cubit.dart';
import 'package:digital_dreams_shop/features/wishlist/presentation/cubit/wishlist_cubit.dart';

import 'package:flutter/material.dart';

import 'package:digital_dreams_shop/config/routes/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<OnBoardingCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<CouponCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<CategoriesCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<PopularCategoriesCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<ProductsBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<WishlistCubit>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.background,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
        ),
      ),
      routerConfig: AppRouter().router,
    );
  }
}
