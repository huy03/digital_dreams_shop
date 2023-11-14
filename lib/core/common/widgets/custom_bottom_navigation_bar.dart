import 'package:digital_dreams_shop/config/theme/colors.dart';

import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    this.selectedIndex = 0,
    required this.children,
  });

  final int selectedIndex;
  final List<BottomBarItem> children;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(30),
        ),
      ),
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          height: 56,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          ),
        ),
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({
    super.key,
    required this.icon,
    required this.selected,
    required this.onPressed,
  });

  final IconData icon;
  final bool selected;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Column(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: 28,
              color:
                  selected ? const Color(0xFFD02D0E) : const Color(0xFFC3C3C3),
            ),
          ),
        ],
      ),
    );
  }
}
