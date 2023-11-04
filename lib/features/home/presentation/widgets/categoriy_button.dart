import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key, required this.content});
  final String content;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 100,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFF6F6F7),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Center(
          child: Text(
            content,
            style: GoogleFonts.lexend(
              fontSize: 15,
              color: AppColor.shadowSecondary.withOpacity(0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
