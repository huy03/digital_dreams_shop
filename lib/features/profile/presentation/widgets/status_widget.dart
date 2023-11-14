import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    super.key,
    required this.color,
    required this.icon,
    required this.content,
    this.onPressed,
  });

  final Color color;
  final String icon;
  final String content;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: SvgPicture.asset(icon),
            style: IconButton.styleFrom(
              backgroundColor: color,
              elevation: 2,
            ),
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
