import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusWidget extends StatelessWidget {
  StatusWidget({
    super.key,
    required this.iconbg,
    required this.imgIcon,
    required this.content,
  });
  @override
  final Color iconbg;
  final String imgIcon;
  final String content;
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: iconbg,
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(imgIcon),
            style: IconButton.styleFrom(
                backgroundColor: iconbg, elevation: 2),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          content,
          style: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: AppColor.bodyText,
          ),
        ),
      ],
    );
  }
}
