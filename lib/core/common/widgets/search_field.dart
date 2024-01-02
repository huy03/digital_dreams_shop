import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, this.controller, this.onSubmitted});

  final TextEditingController? controller;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(18),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: AppColor.primary,
            width: 1.5,
          ),
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
