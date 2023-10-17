import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomeTitleText extends StatelessWidget {
  CustomeTitleText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      title,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0XFF000000),
        ),
      ),
    );
  }
}
