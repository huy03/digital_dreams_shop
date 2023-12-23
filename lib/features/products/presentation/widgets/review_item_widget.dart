import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class ReviewItemWidget extends StatelessWidget {
  const ReviewItemWidget({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            review.user,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: const Color(0xFF666666),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          RatingBar.builder(
            itemSize: 16,
            initialRating: review.rating,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            ignoreGestures: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
            itemBuilder: (context, _) => const Icon(
              Iconsax.star1,
              color: AppColor.star,
            ),
            onRatingUpdate: (rating) {},
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            review.comment,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color(0xFF464646),
            ),
          ),
        ],
      ),
    );
  }
}
