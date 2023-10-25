import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/widgets/custom_button.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/plash_screen.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Subtitle(
                    text:
                        'We help people to getting\n technology products with good price',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomButton(
                    width: 310,
                    height: 43,
                    colortext: AppColor.textLight,
                    colorbg: AppColor.primary,
                    text: 'Let\'s begin',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
