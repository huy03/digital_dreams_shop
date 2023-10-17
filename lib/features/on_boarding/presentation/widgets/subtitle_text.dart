import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Subtitle extends StatelessWidget {
  Subtitle({
    super.key,
    required this.subtitle,
  });
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      subtitle,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0XFF838383).withOpacity(0.7),
        ),
      ),
    );
  }
}
