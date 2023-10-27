import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSocialIcon extends StatelessWidget {
  const CustomSocialIcon({
    super.key,
    required this.img,
    this.onPressed,
  });

  final String img;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(img),
        style: IconButton.styleFrom(
            backgroundColor: Colors.transparent, elevation: 2),
      ),
    );
  }
}
