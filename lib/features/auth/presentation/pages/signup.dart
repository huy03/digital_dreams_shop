import 'package:digital_dreams_shop/features/auth/presentation/widgets/textformfield.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/widgets/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70),
              child: Text(
                'Sign up',
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
              'Create your new account',
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
            CustomTextformfield(),
            const SizedBox(
              height: 15,
            ),
            CustomTextformfield(),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 67, right: 67),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'By signing you agree to our',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF87220F).withOpacity(0.9),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Team of use',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF9FA29E).withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 141, right: 141),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'and',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF87220F).withOpacity(0.9),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'privacy notice',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF9FA29E).withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
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
            CustomBottomBtn(
              colorbg: Color(0xFF87220F),
              width: 350,
              height: 45,
              colortext: Colors.white,
              text: 'Sign up',
            ),
          ],
        ),
      ),
    );
  }
}
