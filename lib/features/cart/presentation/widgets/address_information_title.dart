import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressInformationTitle extends StatelessWidget {
  const AddressInformationTitle({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
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
          value,
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
