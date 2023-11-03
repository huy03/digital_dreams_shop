import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/features/auth/presentation/pages/login.dart';
import 'package:digital_dreams_shop/features/auth/presentation/pages/signup.dart';
import 'package:digital_dreams_shop/features/home/presentation/pages/home_screen.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/welcome_screen.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/page_one.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/page_two.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/pages/page_three.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainOnboardScreen extends StatefulWidget {
  const MainOnboardScreen({super.key});

  @override
  State<MainOnboardScreen> createState() => _MainOnboardScreenState();
}

class _MainOnboardScreenState extends State<MainOnboardScreen> {
  final PageController _pageController = PageController();
  var isLastPage = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void goNextPage() {
    if (!isLastPage) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      context.pushReplacementNamed(RouteNames.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: isLastPage
                ? const NeverScrollableScrollPhysics()
                : const AlwaysScrollableScrollPhysics(),
            onPageChanged: (page) {
              setState(() {
                isLastPage = page == 2;
              });
            },
            controller: _pageController,
            children: const [
              PageOne(),
              PageTwo(),
              PageThree(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 36,
                horizontal: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColor.primary,
                      dotColor: const Color(0XFF9F9797).withOpacity(0.2),
                      dotHeight: 6,
                      dotWidth: 8,
                      spacing: 10,
                    ),
                  ),
                  CustomNextBtn(
                    onPressed: goNextPage,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
