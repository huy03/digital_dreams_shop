import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewProductItem extends StatelessWidget {
  const NewProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 170,
          height: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: const DecorationImage(
              image: AssetImage(MediaResource.advertisementTwo),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'boAT Watch Xtend',
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColor.text,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          'Smart Watch',
          style: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: AppColor.textSecondary,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          '1.195.000',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: AppColor.text,
          ),
        ),
      ],
    );
  }
}
