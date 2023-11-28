import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';
import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:digital_dreams_shop/features/cart/presentation/widgets/check_out_item.dart';
import 'package:digital_dreams_shop/features/cart/presentation/widgets/rowInformation.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/custom_suffix_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

const shipCost = 30000;

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        onPressed: () {
                          context.pop();
                        },
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
                        BlocBuilder<CartCubit, CartState>(
                          builder: (context, state) {
                            if (state is CartLoaded) {
                              return badges.Badge(
                                position: badges.BadgePosition.topEnd(
                                    top: -8, end: -5),
                                badgeContent: Text(
                                  state.cart.cartTotalQuantity.toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.textLight,
                                  ),
                                ),
                                badgeStyle: const badges.BadgeStyle(
                                  badgeColor: AppColor.primary,
                                  padding: EdgeInsets.all(5),
                                ),
                                child: CustomSuffixIcon(
                                  svgImg: MediaResource.cart,
                                  onPressed: () {
                                    context.pushNamed(RouteNames.cart);
                                  },
                                ),
                              );
                            }
                            return const SizedBox();
                          },
                        ),
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
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is CartLoaded) {
                      return SizedBox(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: state.cart.items.length,
                          itemBuilder: (ctx, index) => CheckoutItem(
                            product: state.cart.items[index].product,
                            quantity: state.cart.items[index].quantity,
                            imageCover:
                                state.cart.items[index].product.imageCover,
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
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
                      const Spacer(),
                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          if (state is CartLoaded) {
                            return Text(
                              currency
                                  .format(state.cart.cartTotalPrice)
                                  .toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppColor.text,
                              ),
                            );
                          }
                          return Text(
                            '500.000',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColor.text,
                            ),
                          );
                        },
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
                      const Spacer(),
                      Text(
                        currency.format(shipCost).toString(),
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
                      const Spacer(),
                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          if (state is CartLoaded) {
                            return Text(
                              currency
                                  .format(state.cart.cartTotalPrice + shipCost)
                                  .toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColor.text,
                              ),
                            );
                          }
                          return Text(
                            '530.000',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColor.text,
                            ),
                          );
                        },
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
