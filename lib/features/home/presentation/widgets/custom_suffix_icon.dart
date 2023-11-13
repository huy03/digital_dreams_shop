import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    super.key,
    required this.svgImg,
    this.onPressed,
  });

  final String svgImg;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColor.shadow.withOpacity(0.1),
            blurRadius: 17,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      height: 40,
      width: 40,
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(svgImg),
        style: IconButton.styleFrom(
          backgroundColor: AppColor.background,
          elevation: 2,
        ),
      ),
    );
  }
}
