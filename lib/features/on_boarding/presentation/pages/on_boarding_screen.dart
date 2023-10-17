import 'package:digital_dreams_shop/features/on_boarding/presentation/widgets/background_image.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/widgets/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardScreen1 extends StatelessWidget {
  const OnboardScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundScreen(),
          Positioned(
            top: 700,
            left: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'We help people to getting\ntechnology products with good price',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF838383).withOpacity(0.8),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                CustomBottomBtn(
                    width: 250,
                    height: 45,
                    colortext: Colors.white,
                    colorbg: Color(0xFF87220F),
                    text: "Let's begin")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
