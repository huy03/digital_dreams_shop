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
                  Container(
                    margin: EdgeInsets.only(top: 42),
                    decoration: BoxDecoration(),
                    height: 45,
                    width: 45,
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/svgIcons/arrow_back.svg'),
                      style: IconButton.styleFrom(
                          backgroundColor: Color(0xFF87220F), elevation: 2),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: Text(
                      'Categories',
                      style: GoogleFonts.poppins(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 42),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF000000).withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 17,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    height: 45,
                    width: 45,
                    child: IconButton(
                      onPressed: () {},
                      icon:
                          SvgPicture.asset('assets/svgIcons/message_icon.svg'),
                      style: IconButton.styleFrom(
                          backgroundColor: Color(0xFFFFFFFF), elevation: 2),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(top: 42),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF000000).withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 17,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    height: 45,
                    width: 45,
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/svgIcons/cart_icon.svg'),
                      style: IconButton.styleFrom(
                          backgroundColor: Color(0xFFFFFFFF), elevation: 2),
                    ),
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
