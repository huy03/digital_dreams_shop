import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutItem extends StatelessWidget {
  const CheckoutItem({
    super.key,
    required this.product,
    required this.quantity,
    required this.imageCover,
  });

  final Product product;
  final int quantity;
  final String imageCover;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColor.background,
          boxShadow: [
            BoxShadow(
              color: Color(0xFF969696).withOpacity(0.1),
              offset: const Offset(0, 0),
              blurRadius: 24,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          child: Row(
            children: [
              Container(
                width: 105,
                height: 105,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(imageCover),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      product.name,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: AppColor.text,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    product.category,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.textSecondary,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Text(
                        'Price: ',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.checkOutText,
                        ),
                      ),
                      const SizedBox(
                        width: 70,
                      ),
                      Text(
                        currency.format(product.regularPrice).toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.text,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Quantity: ',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.checkOutText,
                        ),
                      ),
                      const SizedBox(
                        width: 70,
                      ),
                      Text(
                        quantity.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.text,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
