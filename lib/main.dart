import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/features/home/presentation/pages/home_screen.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/welcome_screen.dart';
import 'package:digital_dreams_shop/features/products/presentation/pages/categories.dart';
import 'package:digital_dreams_shop/features/products/presentation/pages/detailHeadphoneScreen.dart';
import 'package:digital_dreams_shop/features/products/presentation/pages/headphoneScreen.dart';
import 'package:flutter/material.dart';

import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/main_onboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.background,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
