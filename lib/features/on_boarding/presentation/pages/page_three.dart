import 'package:digital_dreams_shop/features/on_boarding/presentation/widgets/custom_image.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/widgets/next_button.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/widgets/subtitle_text.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomImage(image: 'assets/images/onboard4.png'),
                const SizedBox(
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TitleText(
                    text: "20% Discount\nNew Arrival Product",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Subtitle(
                    text:
                        'Publish up your selfies to make yourself\nmore beautiful with this app',
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 8.0),
                //   child: Align(
                //     alignment: Alignment.bottomRight,
                //     child: CustomNextBtn(),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
