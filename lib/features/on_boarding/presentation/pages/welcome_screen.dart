import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:flutter/material.dart';

import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';

import 'package:digital_dreams_shop/features/on_boarding/presentation/widgets/subtitle_text.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(MediaResource.splashBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Subtitle(
                    text:
                        'We help people to getting\n technology products with good price',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomButton(
                    width: double.infinity,
                    height: 43,
                    text: 'Let\'s begin',
                    onPressed: () {
                      context.pushReplacementNamed(RouteNames.onBoarding);
                    },
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
