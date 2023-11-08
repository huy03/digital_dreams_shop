import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    super.key,
    required this.image,
    required this.category,
    required this.totalProducts,
    required this.isEven,
    this.onTap,
  });

  final String image;
  final String category;
  final int totalProducts;
  final bool isEven;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 24,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(27),
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27),
          ),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(image),
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
              Positioned(
                top: 20,
                left: isEven ? 24 : null,
                right: isEven ? null : 24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: AppColor.textLight,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '$totalProducts Products',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: AppColor.textLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
