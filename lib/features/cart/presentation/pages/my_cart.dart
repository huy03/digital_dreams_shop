import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';
import 'package:digital_dreams_shop/core/common/widgets/shimmer_widget.dart';
import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:digital_dreams_shop/features/cart/presentation/widgets/cart_item.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/custom_suffix_icon.dart';
import 'package:digital_dreams_shop/features/order/data/models/order_item_model.dart';
import 'package:digital_dreams_shop/features/order/presentation/cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = (context.watch<CartCubit>().state as CartLoaded).cart;

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
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 30,
                ),
                child: Column(
                  children: [
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
                                    .format(state.cart.cartTotalPrice)
                                    .toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.text,
                                ),
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        if (state is! CartLoaded) {
                          return const Text('Something went wrong!');
                        }
                        return CustomButton(
                          width: double.infinity,
                          height: 45,
                          text: 'Checkout',
                          onPressed: cart.cartTotalQuantity == 0
                              ? null
                              : () {
                                  final orderItems = state.cart.items
                                      .map(
                                        (item) => OrderItemModel(
                                          id: item.id,
                                          product: item.product,
                                          quantity: item.quantity,
                                          price: item.price,
                                          color: item.color,
                                        ),
                                      )
                                      .toList();
                                  context
                                      .read<OrderCubit>()
                                      .addOrderItem(orderItems);
                                  context.pushNamed(RouteNames.checkout,
                                      pathParameters: {'cart': 'cart'});
                                },
                        );
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
