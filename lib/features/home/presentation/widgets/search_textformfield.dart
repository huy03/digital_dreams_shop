import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(18),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        filled: true,
        fillColor: AppColor.searchField,
        hintText: 'Search...',
        hintStyle: GoogleFonts.poppins(
          fontSize: 16,
          color: AppColor.textSecondary,
        ),
        prefixIcon: SvgPicture.asset(
          MediaResource.search,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
