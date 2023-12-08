import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PaybyCashBtn extends StatelessWidget {
  const PaybyCashBtn({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: AppColor.background,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFD8D8D8).withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 12,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 18, top: 13, right: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: Ink(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(MediaResource.cash),
                      style: IconButton.styleFrom(
                          backgroundColor: Color(0xFFF4F4F4), elevation: 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Pay by Cash',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColor.bodyText,
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {},
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(MediaResource.next),
                  style: IconButton.styleFrom(
                      backgroundColor: Colors.red.withOpacity(0), elevation: 2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
