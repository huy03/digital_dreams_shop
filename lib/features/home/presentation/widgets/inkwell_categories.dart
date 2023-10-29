import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InkwellCategoriesBtn extends StatelessWidget {
  InkwellCategoriesBtn({super.key, required this.content});
  final String content;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {},
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: Color(0xFFF6F6F7),
        ),
        child: Container(
          width: 100,
          height: 35,
          child: Center(
            child: Text(
              content,
              style: GoogleFonts.lexend(
                fontSize: 15,
                color: Color(0xFF9FA29E).withOpacity(0.8),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
