import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNextBtn extends StatelessWidget {
  const CustomNextBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF462626).withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      height: 45,
      width: 45,
      child: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/svgIcons/arrow_next_icon.svg'),
        style: IconButton.styleFrom(
            backgroundColor: AppColor.primary, elevation: 2),
      ),
    );
  }
}
