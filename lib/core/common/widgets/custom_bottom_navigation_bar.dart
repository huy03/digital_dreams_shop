import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/features/cart/presentation/pages/my_cart.dart';
import 'package:digital_dreams_shop/features/cart/presentation/pages/wishlist.dart';
import 'package:digital_dreams_shop/features/home/presentation/pages/home_screen.dart';
import 'package:digital_dreams_shop/features/profile/presentation/pages/profileScreen.dart';
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
  PageController _myPage = PageController(initialPage: 0);
  void onTap(int index) {}
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
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
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFFD02D0E),
          unselectedItemColor: Color(0xFFC3C3C3),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              _myPage.jumpToPage(index);
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home_25),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.heart5),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.notification5),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.user_octagon1),
              label: '',
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _myPage,
        children: <Widget>[
          HomeScreen(),
          WishlistScreen(),
          MyCartScreen(),
          ProfileScreen(),
        ],
      ),
    );
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
              size: 30,
              color: selected ? Color(0xFFD02D0E) : Color(0xFFC3C3C3),
            ),
          ),
        ],
      ),
    );
  }
}
