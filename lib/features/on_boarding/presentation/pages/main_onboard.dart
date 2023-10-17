import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/on_boarding2.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/on_boarding3.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/on_boarding4.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainOnboardScreen extends StatelessWidget {
  PageController _controller = PageController();
  MainOnboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          PageView(
            controller: _controller,
            children: [
              OnboardScreen2(),
              OnboardScreen3(),
              OnboardScreen4(),
            ],
          ),
          Container(
            alignment: Alignment(-0.78, 0.83),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Color(0xFFF87220F),
                dotColor: Color(0XFF9F9797).withOpacity(0.2),
                dotHeight: 6,
                dotWidth: 8,
                spacing: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
