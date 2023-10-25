import 'package:digital_dreams_shop/features/home/presentation/widgets/search_textformfield.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 42),
                  decoration: BoxDecoration(),
                  height: 45,
                  width: 45,
                  child: IconButton(
                    onPressed: () {},
                    icon:
                        SvgPicture.asset('assets/svgIcons/menu_home_icon.svg'),
                    style: IconButton.styleFrom(
                        backgroundColor: Color(0xFF87220F), elevation: 2),
                  ),
                ),
                const SizedBox(
                  width: 200,
                ),
                Container(
                  margin: EdgeInsets.only(top: 42),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF000000).withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 17,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  height: 45,
                  width: 45,
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/svgIcons/message_icon.svg'),
                    style: IconButton.styleFrom(
                        backgroundColor: Color(0xFFFFFFFF), elevation: 2),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(top: 42),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF000000).withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 17,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  height: 45,
                  width: 45,
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/svgIcons/cart_icon.svg'),
                    style: IconButton.styleFrom(
                        backgroundColor: Color(0xFFFFFFFF), elevation: 2),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Welcome,',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000),
              ),
            ),
            Text(
              'Our Shopping App',
              style: GoogleFonts.poppins(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF9FA29E).withOpacity(0.9),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: SearchTextFormField(),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: ((ctx, index) => Padding(
                        padding: const EdgeInsets.only(right: 17, top: 24),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 280,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/50%_off_image.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 17, left: 17),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '50% Off',
                                        style: GoogleFonts.poppins(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        'On everything today',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'With code: FSCREATION',
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Get now',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF87220F),
                                          minimumSize: Size(70, 27),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ))),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'New Arrivals,',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000),
                  ),
                ),
                Spacer(),
                Text(
                  'View All',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF666666),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: ((ctx, index) => Padding(
                      padding: const EdgeInsets.only(right: 17, top: 15),
                      child: Column(
                        children: [
                          Container(
                            width: 155,
                            height: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/50%_off_image.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            'boAT Watch Xtend',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF000000),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Smart Watch',
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF666666),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            '1.195.000',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Categories',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000),
                  ),
                ),
                Spacer(),
                Text(
                  'View All',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
