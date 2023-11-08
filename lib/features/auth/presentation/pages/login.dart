import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/core/utils/injection_container.dart';
import 'package:digital_dreams_shop/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:digital_dreams_shop/features/auth/presentation/widgets/custom_inkwell_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/features/auth/presentation/widgets/custom_social_icon.dart';
import 'package:digital_dreams_shop/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void logIn() async {
    final isValidate = _formKey.currentState!.validate();
    if (isValidate) {
      BlocProvider.of<AuthBloc>(context).add(
        SignInWithEmailAndPasswordEvent(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.goNamed(RouteNames.home);
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.primary,
              ),
            );
          }
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Form(
                  key: _formKey,
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
                      CustomTextFormField(
                        hintText: 'Email',
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!EmailValidator.validate(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        hintText: 'Password',
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
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
                        onPressed: logIn,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
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
                              context.pushNamed(RouteNames.signUp);
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
        },
      ),
    );
  }
}
