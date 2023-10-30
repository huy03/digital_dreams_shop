import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InformationRow extends StatelessWidget {
  InformationRow({
    super.key,
    required this.title,
    required this.subtitle,
  });
  @override
  final String title;
  final String subtitle;
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: AppColor.text,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          subtitle,
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: AppColor.checkOutText,
          ),
        ),
      ],
    );
  }
}
