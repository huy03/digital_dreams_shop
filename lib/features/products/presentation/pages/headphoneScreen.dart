import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/advertisement_item.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/custom_suffix_icon.dart';
import 'package:digital_dreams_shop/core/common/widgets/search_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadphoneScreen extends StatelessWidget {
  const HeadphoneScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 42),
          child: Column(children: [
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
                  'Headphones',
                  style: GoogleFonts.poppins(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000),
                  ),
                ),
                const SizedBox(
                  width: 25,
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
              child: Row(
                children: [
                  const Expanded(child: SearchField()),
                  const SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(MediaResource.filter),
                      style: IconButton.styleFrom(
                          backgroundColor: AppColor.primary, elevation: 2),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ]),
        ),
      ),
    );
  }
}
