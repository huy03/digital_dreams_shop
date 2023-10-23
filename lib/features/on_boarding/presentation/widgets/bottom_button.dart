import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomBtn extends StatelessWidget {
  const CustomBottomBtn({
    super.key,
    required this.width,
    required this.height,
    required this.colortext,
    required this.colorbg,
    required this.text,
 
  });

  final double width;
  final double height;
  final String text;
  final Color colortext;
  final Color colorbg;
 

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    text,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: colortext,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorbg,
                    minimumSize: Size(width, height),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
  }
}
