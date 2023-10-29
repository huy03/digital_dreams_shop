import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/features/auth/presentation/pages/signup.dart';
import 'package:digital_dreams_shop/features/auth/presentation/widgets/custom_inkwell_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/features/auth/presentation/widgets/custom_social_icon.dart';
import 'package:digital_dreams_shop/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //const GlobalKey _globalKey =

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 180),
                  child: Text(
                    'Welcome back',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Login to your account',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Remember me',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColor.textSecondary.withOpacity(0.9),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Forgot password?',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primary.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 120,
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
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomSocialIcon(
                      img: MediaResource.facebook,
                      onPressed: () {},
                    ),
                    CustomSocialIcon(
                      img: MediaResource.google,
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
                  text: 'Login',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Do you have an account?",
                      style: GoogleFonts.lexend(
                        fontSize: 12,
                        color: AppColor.textSecondary.withOpacity(0.9),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    CusInkwellBtn(
                      textColor: AppColor.primary.withOpacity(0.9),
                      content: 'Sign up',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
