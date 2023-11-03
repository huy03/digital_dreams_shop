import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/features/auth/presentation/pages/login.dart';
import 'package:digital_dreams_shop/features/auth/presentation/widgets/custom_inkwell_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/features/auth/presentation/widgets/custom_social_icon.dart';
import 'package:digital_dreams_shop/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void signUp() {
    _formKey.currentState!.validate();
  }

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
              child: Form(
                key: _formKey,
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
                    CustomTextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      hintText: 'Phone Number',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone number is required!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: 'Password',
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().isEmpty) {
                          return 'Password is required!';
                        }
                        if (value.trim().length < 8) {
                          return 'Password must be at least 8 characters!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: _confirmPasswordController,
                      hintText: 'Confirm Password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password!';
                        }
                        if (value != _passwordController.text) {
                          return 'Password does not match!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
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
                      height: 80,
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
                      height: 20,
                    ),
                    CustomButton(
                      width: double.infinity,
                      height: 45,
                      text: 'Sign up',
                      onPressed: signUp,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
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
                          content: 'Log in',
                          onTap: () {
                            context.pushNamed(RouteNames.login);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
