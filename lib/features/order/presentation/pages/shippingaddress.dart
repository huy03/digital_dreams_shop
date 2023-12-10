import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';
import 'package:digital_dreams_shop/features/order/presentation/widgets/address_widgets.dart';
import 'package:digital_dreams_shop/features/profile/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: SvgPicture.asset(MediaResource.arrowBack),
                      style: IconButton.styleFrom(
                          backgroundColor: AppColor.primary, elevation: 2),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Address',
                    style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: AppColor.text,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: AddressWidget(),
              ),
              const SizedBox(
                height: 15,
              ),
              AddressWidget(),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE3E3E3),
                  disabledBackgroundColor: AppColor.primary.withOpacity(0.5),
                  minimumSize: Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Add Address',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppColor.bodyText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.background,
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xff464646).withOpacity(0.1),
                        offset: const Offset(
                          0,
                          -4,
                        ),
                        blurRadius: 24.0,
                        spreadRadius: 0)
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 30,
                  ),
                  child: Column(
                    children: [
                      TextFormFieldSetting(content: 'Name'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
