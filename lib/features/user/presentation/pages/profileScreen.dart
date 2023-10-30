import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';
import 'package:digital_dreams_shop/features/user/presentation/widgets/infoBtn.dart';
import 'package:digital_dreams_shop/features/user/presentation/widgets/statusWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 42),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: <Widget>[
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: const DecorationImage(
                          image: AssetImage(MediaResource.profile),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 55,
                      right: 0,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.text.withOpacity(0.13),
                              offset: const Offset(0, 3),
                              blurRadius: 17,
                              spreadRadius: 0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(MediaResource.pen),
                          style: IconButton.styleFrom(
                              backgroundColor: AppColor.background,
                              elevation: 2),
                        ),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Thanh Hien Tran',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF313131),
                          ),
                        ),
                        Text(
                          'tranthanhhien123bt@gmail.com',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFA9A6A6),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Text(
                      'My orders',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.text,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'View All',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColor.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    StatusWidget(
                        iconbg: Color(0xFFFFF0ED),
                        imgIcon: MediaResource.pay,
                        content: 'To Pay'),
                    Padding(
                      padding: const EdgeInsets.only(left: 49),
                      child: StatusWidget(
                          iconbg: Color(0xFFFFF0ED),
                          imgIcon: MediaResource.ship,
                          content: 'To Ship'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 49),
                      child: StatusWidget(
                          iconbg: Color(0xFFEDFBEE),
                          imgIcon: MediaResource.receive,
                          content: 'To Receive'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 49),
                      child: StatusWidget(
                          iconbg: Color(0xFFFFFAE8),
                          imgIcon: MediaResource.rate,
                          content: 'To Rate'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  children: [
                    Text(
                      'My information',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.text,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: InformationBtn(
                        content: 'Privacy and Settings',
                        imgIcon: MediaResource.privacy),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: InformationBtn(
                        content: 'Payment method',
                        imgIcon: MediaResource.payment),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: InformationBtn(
                        content: 'Loyalty card & Point',
                        imgIcon: MediaResource.point),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: InformationBtn(
                        content: 'Gift cards', imgIcon: MediaResource.gift),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: InformationBtn(
                        content: 'Help Center', imgIcon: MediaResource.help),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: CustomButton(
                  width: double.infinity,
                  height: 45,
                  text: 'Log out',
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
