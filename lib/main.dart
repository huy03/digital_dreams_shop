import 'package:digital_dreams_shop/features/auth/presentation/pages/login.dart';
import 'package:digital_dreams_shop/features/auth/presentation/pages/signup.dart';
import 'package:digital_dreams_shop/features/home/presentation/pages/homescreen.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/main_onboard.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/on_boarding2.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/on_boarding3.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/widgets/background_image.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/on_boarding_screen.dart';
import 'package:digital_dreams_shop/features/products/presentation/pages/categories.dart';
import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CategoriesScreen(),
    );
  }
}

