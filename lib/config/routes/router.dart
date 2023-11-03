import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/features/auth/presentation/pages/login.dart';
import 'package:digital_dreams_shop/features/auth/presentation/pages/signup.dart';
import 'package:digital_dreams_shop/features/home/presentation/pages/home_screen.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/main_onboard.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter router = GoRouter(
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
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final tween =
                  Tween(begin: const Offset(1, 0), end: Offset.zero).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              );
              return SlideTransition(
                position: tween,
                child: child,
              );
            }),
      ),
      GoRoute(
        name: RouteNames.login,
        path: '/logIn',
        pageBuilder: (context, state) => CustomTransitionPage(
            child: const LoginScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final tween =
                  Tween(begin: const Offset(-1, 0), end: Offset.zero).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              );
              return SlideTransition(
                position: tween,
                child: child,
              );
            }),
      ),
      GoRoute(
        name: RouteNames.signUp,
        path: '/signUp',
        pageBuilder: (context, state) => CustomTransitionPage(
            child: const SignUpScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final tween =
                  Tween(begin: const Offset(1, 0), end: Offset.zero).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              );
              return SlideTransition(
                position: tween,
                child: child,
              );
            }),
      ),
      GoRoute(
        name: RouteNames.home,
        path: '/home',
        pageBuilder: (context, state) => CustomTransitionPage(
            child: const HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final tween =
                  Tween(begin: const Offset(1, 0), end: Offset.zero).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              );
              return SlideTransition(
                position: tween,
                child: child,
              );
            }),
      ),
    ],
  );
}
