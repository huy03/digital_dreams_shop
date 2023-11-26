import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';
import 'package:digital_dreams_shop/core/common/widgets/shimmer_widget.dart';
import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:digital_dreams_shop/features/cart/presentation/widgets/cart_item.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/custom_suffix_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  int shipCost = 30000;

  @override
  void initState() {
    super.initState();
    //context.read<CartCubit>().fetchCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 30.0,
                left: 30,
                top: 24,
              ),
              child: Row(
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
                        backgroundColor: AppColor.primary,
                        elevation: 2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'My cart',
                    style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF000000),
                    ),
                  ),
                  const Spacer(),
                  CustomSuffixIcon(
                    svgImg: MediaResource.message,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartLoading) {
                    return ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        return const Padding(
                          padding: EdgeInsets.only(
                              left: 30, right: 30, bottom: 20.0),
                          child: ShimmerWidget(
                            height: 150,
                            width: double.infinity,
                            radius: 20,
                          ),
                        );
                      },
                    );
                  }
                  if (state is CartError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  if (state is CartLoaded) {
                    if (state.cart.items.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Your cart is empty',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppColor.text,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              width: 150,
                              height: 45,
                              text: 'Continue shopping',
                              onPressed: () {
                                context.pop();
                              },
                            )
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: state.cart.items.length,
                      itemBuilder: (ctx, index) => CartItem(
                        product: state.cart.items[index].product,
                        quantity: state.cart.items[index].quantity,
                        imageCover: state.cart.items[index].product.imageCover,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                color: AppColor.background,
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xff464646).withOpacity(0.1),
                      offset: const Offset(
                        0,
                        -4,
                      ),
                      blurRadius: 24.0,
                      spreadRadius: 0)
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Subtotal',
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Delivery & Handing',
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
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          'Total',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
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
                                    .format(
                                        state.cart.cartTotalPrice + shipCost)
                                    .toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.text,
                                ),
                              );
                            }
                            return Text(
                              currency.format(shipCost).toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppColor.text,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomButton(
                      width: double.infinity,
                      height: 45,
                      text: 'Checkout',
                      onPressed: () {
                        context.pushNamed(RouteNames.checkout);
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
