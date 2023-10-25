import 'package:digital_dreams_shop/features/auth/presentation/widgets/textformfield.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 180),
                child: Text(
                  'Welcome back',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7D210F),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Login to your account',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9FA29E).withOpacity(0.9),
                ),
              ),
              const SizedBox(
                height: 55,
              ),
              CustomTextformfield(),
              const SizedBox(
                height: 15,
              ),
              CustomTextformfield(),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Remember me',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF9FA29E).withOpacity(0.9),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Forgot password?',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7D210F).withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 160,
              ),
              Text(
                'or continue with',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF9FA29E).withOpacity(0.9),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 116, right: 116),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 32),
                      height: 70,
                      width: 70,
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/svgIcons/fb.svg'),
                        style: IconButton.styleFrom(
                            backgroundColor: Colors.transparent, elevation: 2),
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(top: 32),
                      height: 70,
                      width: 70,
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/svgIcons/google.svg'),
                        style: IconButton.styleFrom(
                            backgroundColor: Colors.transparent, elevation: 2),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              CustomButton(
                width: 350,
                height: 45,
                text: 'Login',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
