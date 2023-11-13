import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/features/cart/presentation/pages/my_cart.dart';
import 'package:digital_dreams_shop/features/cart/presentation/pages/wishlist.dart';
import 'package:digital_dreams_shop/features/home/presentation/pages/home_screen.dart';
import 'package:digital_dreams_shop/features/profile/presentation/pages/profileScreen.dart';
import 'package:digital_dreams_shop/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/retry.dart';
import 'package:iconsax/iconsax.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 0;
  final screen = [
    HomeScreen(),
    WishlistScreen(),
    MyCartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: screen[_selectedIndex],
        bottomNavigationBar: Container(
      height: 80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: const Color(0xff464646).withOpacity(0.1),
              offset: const Offset(
                0,
                -4,
              ),
              blurRadius: 24.0,
              spreadRadius: 0)
        ],
        color: AppColor.background,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(30)),
      ),
      child: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: SizedBox(
          height: 56,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBottomBar(
                imgicon: Iconsax.home_25,
                selected: _selectedIndex == 0,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
              ),
              IconBottomBar(
                imgicon: Iconsax.heart5,
                selected: _selectedIndex == 1,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
              IconBottomBar(
                imgicon: Iconsax.notification5,
                selected: _selectedIndex == 2,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
              ),
              IconBottomBar(
                imgicon: Iconsax.user_octagon1,
                selected: _selectedIndex == 3,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar({
    super.key,
    required this.imgicon,
    required this.selected,
    required this.onPressed,
  });
  @override
  final IconData imgicon;
  final bool selected;
  final Function() onPressed;
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 7, left: 15, right: 15),
      child: Column(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              imgicon,
              size: 28,
              color: selected ? Color(0xFFD02D0E) : Color(0xFFC3C3C3),
            ),
          ),
        ],
      ),
    );
  }
}
