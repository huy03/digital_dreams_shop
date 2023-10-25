import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/page_one.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/page_two.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/page_three.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/page_four.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainOnboardScreen extends StatelessWidget {
  const MainOnboardScreen({super.key});

  //final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            //controller: _controller,
            children: const [
              PageOne(),
              PageTwo(),
              PageThree(),
              PageFour(),
            ],
          ),
          // Container(
          //   alignment: Alignment(-0.78, 0.83),
          //   child: SmoothPageIndicator(
          //     controller: _controller,
          //     count: 3,
          //     effect: ExpandingDotsEffect(
          //       activeDotColor: Color(0xFFF87220F),
          //       dotColor: Color(0XFF9F9797).withOpacity(0.2),
          //       dotHeight: 6,
          //       dotWidth: 8,
          //       spacing: 10,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
