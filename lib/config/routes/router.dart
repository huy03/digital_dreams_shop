import 'package:digital_dreams_shop/application.dart';
import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_bottom_navigation_bar.dart';
import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/core/utils/injection_container.dart';
import 'package:digital_dreams_shop/features/auth/presentation/pages/login.dart';
import 'package:digital_dreams_shop/features/auth/presentation/pages/signup.dart';
import 'package:digital_dreams_shop/features/order/presentation/pages/checkout.dart';
import 'package:digital_dreams_shop/features/cart/presentation/pages/my_cart.dart';
import 'package:digital_dreams_shop/features/on_boarding/data/data_sources/on_boarding_local_data_sources.dart';
import 'package:digital_dreams_shop/features/order/presentation/pages/shipping_address.dart';
import 'package:digital_dreams_shop/features/profile/presentation/pages/settings.dart';
import 'package:digital_dreams_shop/features/wishlist/presentation/pages/wishlist.dart';
import 'package:digital_dreams_shop/features/home/presentation/pages/home_screen.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/main_onboard.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/welcome_screen.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/products/presentation/pages/categories.dart';
import 'package:digital_dreams_shop/features/products/presentation/pages/product_detail.dart';
import 'package:digital_dreams_shop/features/products/presentation/pages/detail_category.dart';
import 'package:digital_dreams_shop/features/products/presentation/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: //'/settings',
        sl<SharedPreferences>().getBool(kFirstTimer) == null
            ? '/'
            : ((sl<SharedPreferences>().getString(kAuthToken) == null ||
                    sl<SharedPreferences>().getString(kAuthToken) == '')
                ? '/logIn'
                : '/application'),
    routes: [
      GoRoute(
        name: RouteNames.welcome,
        path: '/',
        pageBuilder: (context, state) => const MaterialPage(
          child: WelcomeScreen(),
        ),
      ),
      GoRoute(
        name: RouteNames.onBoarding,
        path: '/onBoarding',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const MainOnboardScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.login,
        path: '/logIn',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.signUp,
        path: '/signUp',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SignUpScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.home,
        path: '/home',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.category,
        path: '/category',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const CategoriesScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.productByCategory,
        path: '/productByCategory/:category/:categoryId',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: DetailCategoryScreen(
            category: state.pathParameters['category']!,
            categoryId: state.pathParameters['categoryId']!,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.productDetail,
        path: '/productDetail',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: ProductDetailScreen(
            product: state.extra as Product,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.cart,
        path: '/cart',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const MyCartScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.checkout,
        path: '/checkout',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const CheckoutScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.search,
        path: '/search/:text',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: SearchScreen(
            text: state.pathParameters['text']!,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.wishlist,
        path: '/wishlist',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const WishlistScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.application,
        path: '/application',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const ApplicationScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.settings,
        path: '/settings',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const SettingProfile(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
      GoRoute(
        name: RouteNames.address,
        path: '/address',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const ShippingAddress(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return buildTransition(
                context, animation, secondaryAnimation, child);
          },
        ),
      ),
    ],
  );
}

SlideTransition buildTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final tween = Tween(begin: const Offset(1, 0), end: Offset.zero).animate(
    CurvedAnimation(parent: animation, curve: Curves.easeInOut),
  );
  return SlideTransition(
    position: tween,
    child: child,
  );
}
