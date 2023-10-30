import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';
import 'package:digital_dreams_shop/features/cart/presentation/widgets/rowInformation.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/custom_suffix_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Stack(children: [
          Padding(
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
                      'Checkout',
                      style: GoogleFonts.poppins(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000),
                      ),
                    ),
                    const SizedBox(
                      width: 61,
                    ),
                    Row(
                      children: [
                        CustomSuffixIcon(
                          svgImg: MediaResource.message,
                          onPressed: () {},
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        CustomSuffixIcon(
                          svgImg: MediaResource.cart,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  height: 210,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColor.background,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFE3DBDD).withOpacity(0.25),
                        offset: const Offset(5, 5),
                        blurRadius: 15,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 20, top: 18),
                    child: Column(
                      children: [
                        InformationRow(
                            subtitle: '28A Nguyen Du', title: 'Street: '),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: InformationRow(
                              subtitle: 'Ho Chi Minh', title: 'City: '),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: InformationRow(
                              title: 'State/province: ',
                              subtitle: 'Ho Chi Minh'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: InformationRow(
                              title: 'Phone number: ', subtitle: '0398285020'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: InformationRow(
                              title: 'Country calling code: ', subtitle: '+84'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: InformationRow(
                              title: 'Country: ', subtitle: 'Vietnam'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      'Home Delivery',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.text,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: ((ctx, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Container(
                            width: double.infinity,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: AppColor.background,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF969696).withOpacity(0.1),
                                  offset: const Offset(0, 0),
                                  blurRadius: 24,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 105,
                                    height: 105,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            MediaResource.popularProductOne),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Apple Watch',
                                        style: GoogleFonts.poppins(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w700,
                                          color: AppColor.text,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        'Smart Watch',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.textSecondary,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Price: ',
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.checkOutText,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 70,
                                          ),
                                          Text(
                                            "300.000",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.text,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Quantity: ',
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.checkOutText,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 70,
                                          ),
                                          Text(
                                            "2",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.text,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Text(
                        'Subtotal: ',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.checkOutText,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '500.000',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColor.text,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Text(
                        'Shipping fee: ',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.checkOutText,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '40.000',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColor.text,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Text(
                        'Subtotal',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.text,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '530.000',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.text,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Text(
                        'Total: 530.000',
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: AppColor.text,
                        ),
                      ),
                      Spacer(),
                      CustomButton(
                          width: 65,
                          height: 50,
                          text: 'Pay Now',
                          onPressed: () {})
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
