import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';
import 'package:digital_dreams_shop/core/common/widgets/shimmer_widget.dart';
import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/core/utils/injection_container.dart';
import 'package:digital_dreams_shop/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:digital_dreams_shop/features/profile/presentation/widgets/info_item.dart';
import 'package:digital_dreams_shop/features/profile/presentation/widgets/status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 24,
            ),
            child: Column(
              children: [
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return const Row(
                        children: [
                          ShimmerWidget(
                            width: 80,
                            height: 80,
                            radius: 100,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ShimmerWidget(
                                  width: 50,
                                  height: 20,
                                  radius: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: ShimmerWidget(
                                    width: 100,
                                    height: 20,
                                    radius: 10,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }
                    if (state is! ProfileLoaded) {
                      return const Text('Something went wrong');
                    }
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                  image: NetworkImage(state.user.avatar!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
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
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.user.userName,
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF313131),
                                ),
                              ),
                              Text(
                                state.user.email,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFFA9A6A6),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
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
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      StatusWidget(
                        color: Color(0xFFFFF0ED),
                        icon: MediaResource.pay,
                        content: 'To Pay',
                        onPressed: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 49),
                        child: StatusWidget(
                          color: Color(0xFFFFF0ED),
                          icon: MediaResource.ship,
                          content: 'To Ship',
                          onPressed: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 49),
                        child: StatusWidget(
                          color: Color(0xFFEDFBEE),
                          icon: MediaResource.receive,
                          content: 'To Receive',
                          onPressed: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 49),
                        child: StatusWidget(
                          color: Color(0xFFFFFAE8),
                          icon: MediaResource.rate,
                          content: 'To Rate',
                          onPressed: () {},
                        ),
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
                      child: InformationItem(
                        content: 'Privacy and Settings',
                        icon: MediaResource.privacy,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: InformationItem(
                          content: 'Payment method',
                          icon: MediaResource.payment),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: InformationItem(
                          content: 'Loyalty card & Point',
                          icon: MediaResource.point),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: InformationItem(
                        content: 'Gift cards',
                        icon: MediaResource.gift,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: InformationItem(
                        content: 'Help Center',
                        icon: MediaResource.help,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: CustomButton(
                    width: double.infinity,
                    height: 45,
                    text: 'Log out',
                    onPressed: () {
                      sl<SharedPreferences>().setString(kAuthToken, '');
                      context.pushReplacementNamed(RouteNames.login);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
