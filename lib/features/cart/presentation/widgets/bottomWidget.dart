import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 645),
      child: Container(
        width: double.infinity,
        height: 220,
        decoration: BoxDecoration(
          color: Colors.white,
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
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
      ),
    );
  }
}
