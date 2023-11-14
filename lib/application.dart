import 'package:digital_dreams_shop/core/common/widgets/custom_bottom_navigation_bar.dart';
import 'package:digital_dreams_shop/features/cart/presentation/pages/my_cart.dart';
import 'package:digital_dreams_shop/features/wishlist/presentation/pages/wishlist.dart';
import 'package:digital_dreams_shop/features/home/presentation/pages/home_screen.dart';
import 'package:digital_dreams_shop/features/profile/presentation/pages/profile.dart';

import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

const screen = [
  HomeScreen(),
  WishlistScreen(),
  MyCartScreen(),
  ProfileScreen(),
];

class ApplicationScreen extends StatefulWidget {
  const ApplicationScreen({super.key});

  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        children: [
          BottomBarItem(
            icon: Iconsax.home_25,
            selected: _selectedIndex == 0,
            onPressed: () {
              setState(
                () {
                  _selectedIndex = 0;
                },
              );
            },
          ),
          BottomBarItem(
            icon: Iconsax.heart5,
            selected: _selectedIndex == 1,
            onPressed: () {
              setState(
                () {
                  _selectedIndex = 1;
                },
              );
            },
          ),
          BottomBarItem(
            icon: Iconsax.notification5,
            selected: _selectedIndex == 2,
            onPressed: () {
              setState(
                () {
                  _selectedIndex = 2;
                },
              );
            },
          ),
          BottomBarItem(
            icon: Iconsax.user_octagon1,
            selected: _selectedIndex == 3,
            onPressed: () {
              setState(
                () {
                  _selectedIndex = 3;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
