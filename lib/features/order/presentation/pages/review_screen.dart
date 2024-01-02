import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/features/order/presentation/cubit/order_cubit.dart';
import 'package:digital_dreams_shop/features/order/presentation/cubit/product_rate_cubit.dart';
import 'package:digital_dreams_shop/features/order/presentation/widgets/review_product_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key, required this.orderId});

  final String orderId;

  @override
  Widget build(BuildContext context) {
    final rateProducts = context.watch<ProductRateCubit>().state.rateProducts;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
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
                    'Rate Product',
                    style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: AppColor.text,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              BlocListener<ProductRateCubit, ProductRateState>(
                listener: (context, state) async {
                  if (state.rateProducts.isEmpty) {
                    context
                        .read<OrderCubit>()
                        .informOrderStatus(orderId, 'Completed');
                    await showDialog(
                      context: context,
                      builder: (ctx) {
                        return Dialog(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 24,
                              horizontal: 18,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  MediaResource.success,
                                  width: 100,
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  'Successful!',
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primary,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'Thank you for your feedback! Your review has been submitted.',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF666666),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.add,
                                    color: AppColor.textLight,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 24,
                                    ),
                                  ),
                                  onPressed: () {
                                    context.pop();
                                    context.pushReplacementNamed(
                                        RouteNames.application);
                                  },
                                  label: Text(
                                    'Continue shopping',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: AppColor.textLight,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
                child: Expanded(
                  child: ListView.builder(
                    itemCount: rateProducts.length,
                    itemBuilder: (ctx, index) => ReviewProductItem(
                      item: rateProducts[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
