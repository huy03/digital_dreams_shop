import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';
import 'package:digital_dreams_shop/features/order/presentation/widgets/payment_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 42),
          child: Column(
            children: [
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
                    'Payment method',
                    style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: PaymentButton(icon: MediaResource.momo, content: 'Momo'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child:
                    PaymentButton(icon: MediaResource.zalo, content: 'ZaloPay'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: PaymentButton(icon: MediaResource.MB, content: 'Card'),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                width: double.infinity,
                height: 45,
                text: 'Add card',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
