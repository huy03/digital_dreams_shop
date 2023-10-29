import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CusInwellBtn extends StatelessWidget {
  CusInwellBtn(
      {super.key,
      required this.colortext,
      required this.content,
      required this.height,
      required this.width});
  final Color colortext;
  final String content;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {},
      child: Container(
        width: width,
        height: height,
        color: Colors.transparent, // Đặt màu nền của container thành trong suốt
        child: Center(
          child: Text(
            content,
            style: GoogleFonts.lexend(
              decoration: TextDecoration.underline,
              decorationColor: colortext,
              fontSize: 12,
              color: colortext,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}