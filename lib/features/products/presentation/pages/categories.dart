import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/custom_suffix_icon.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/search_textformfield.dart';
import 'package:digital_dreams_shop/features/products/presentation/widgets/categories_box_left.dart';
import 'package:digital_dreams_shop/features/products/presentation/widgets/categories_box_right.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 42),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(MediaResource.arrowBack),
                      style: IconButton.styleFrom(
                          backgroundColor: AppColor.primary, elevation: 2),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Categories',
                    style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                  const SizedBox(
                    width: 43,
                  ),
                  Row(
                    children: [
                      CustomSuffixIcon(
                        svgImg: MediaResource.message,
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      CustomSuffixIcon(
                        svgImg: MediaResource.cart,
                        onPressed: () {},
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SearchTextFormField(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: CategoriesLeftBox(
                  image: "assets/images/phone_categories.png",
                  title: "Phones",
                  subtitle: "121 Products",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: CategoriesRightBox(
                  image: "assets/images/laptop_categories.png",
                  title: "Phones",
                  subtitle: "121 Products",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: CategoriesLeftBox(
                  image: "assets/images/watch_categories.png",
                  title: "Watchs",
                  subtitle: "121 Products",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: CategoriesRightBox(
                  image: "assets/images/tablet_categories.png",
                  title: "Phones",
                  subtitle: "121 Products",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: CategoriesLeftBox(
                  image: "assets/images/headphone_categories.png",
                  title: "Headphones",
                  subtitle: "46 Products",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: CategoriesRightBox(
                  image: "assets/images/camera_categories.png",
                  title: "Phones",
                  subtitle: "121 Products",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
