import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/features/home/domain/entities/coupon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class CouponItem extends StatelessWidget {
  const CouponItem({super.key, required this.coupon, this.onTap});

  final Coupon coupon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(coupon.imageCover),
            fit: BoxFit.cover,
            height: 180,
            width: 260,
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${coupon.discountValue}% Off',
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: AppColor.text,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  coupon.subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.text,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'With code: ${coupon.code}',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColor.text,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Get now',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColor.textLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
