import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
    required this.address,
    required this.value,
    required this.groupValue,
    this.onChanged,
  });

  final Address address;
  final int value;
  final int groupValue;
  final void Function(int?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      height: 170,
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
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(MediaResource.locate),
                style: IconButton.styleFrom(
                    backgroundColor: Color(0xFFF4F4F4), elevation: 1),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.customer,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.bodyText,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    address.phoneNumber,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFA9A6A6),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    address.detailedAddress,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFA9A6A6),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    address.district,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFA9A6A6),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    address.city,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFA9A6A6),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    address.country,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFA9A6A6),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Radio<int>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
