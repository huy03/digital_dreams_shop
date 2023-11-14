import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:digital_dreams_shop/config/theme/colors.dart';

class BuynowButton extends StatelessWidget {
  const BuynowButton({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.onPressed,
  });

  final double width;
  final double height;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: AppColor.textLight,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
