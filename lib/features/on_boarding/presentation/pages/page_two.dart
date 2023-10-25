import 'package:digital_dreams_shop/features/on_boarding/presentation/widgets/description_text.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/widgets/next_button.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/onboard2.png',
              ),
              const SizedBox(
                height: 50,
              ),
              CustomeTitleText(
                title: "Take Advantage\nOf The Offer Shopping",
              ),
              const SizedBox(
                height: 30,
              ),
              const Subtitle(
                text:
                    'Publish up your selfies to make yourself\nmore beautiful with this app',
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomNextBtn(),
            ],
          ),
        ),
      ),
    );
  }
}
