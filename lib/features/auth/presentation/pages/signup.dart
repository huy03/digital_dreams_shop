import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/features/auth/presentation/widgets/custom_social_icon.dart';
import 'package:digital_dreams_shop/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                children: [
                  Text(
                    'Sign up',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Create your new account',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColor.textSecondary.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  const CustomTextFormField(
                    hintText: 'Phone Number',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomTextFormField(
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomTextFormField(
                    hintText: 'Password',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomTextFormField(
                    hintText: 'Confirm Password',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'By signing you agree to our',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primary.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Team of use',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColor.textSecondary.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'and',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primary.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'privacy notice',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColor.textSecondary.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    'or continue with',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColor.textSecondary.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomSocialIcon(
                        img: 'assets/svgIcons/fb.svg',
                        onPressed: () {},
                      ),
                      CustomSocialIcon(
                        img: 'assets/svgIcons/google.svg',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  CustomButton(
                    width: double.infinity,
                    height: 45,
                    text: 'Sign up',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
