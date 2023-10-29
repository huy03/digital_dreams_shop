import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CusInkwellBtn extends StatelessWidget {
  const CusInkwellBtn({
    super.key,
    required this.textColor,
    required this.content,
    this.onTap,
  });

  final Color textColor;
  final String content;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        content,
        style: GoogleFonts.lexend(
          decoration: TextDecoration.underline,
          decorationColor: textColor,
          fontSize: 12,
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
