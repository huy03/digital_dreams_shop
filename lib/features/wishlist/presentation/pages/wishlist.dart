import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/common/widgets/shimmer_widget.dart';
import 'package:digital_dreams_shop/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/custom_suffix_icon.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:digital_dreams_shop/features/wishlist/presentation/widgets/wishlist_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  List<Product> wishlistProducts = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WishlistCubit>(context).fetchWishlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 24,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Wishlist',
                    style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: AppColor.text,
                    ),
                  ),
                  const Spacer(),
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
                          position:
                              badges.BadgePosition.topEnd(top: -8, end: -5),
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
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: BlocConsumer<WishlistCubit, WishlistState>(
                  listener: (context, state) {
                    if (state is WishlistSuccess) {
                      wishlistProducts.clear();
                      wishlistProducts.addAll(state.products);
                    }
                    if (state is DeleteFromWishlistSuccess) {
                      wishlistProducts.clear();
                      wishlistProducts.addAll(state.products);
                    }
                  },
                  builder: (context, state) {
                    if (state is WishlistLoading) {
                      return ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          return const Padding(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: ShimmerWidget(
                              height: 150,
                              width: double.infinity,
                              radius: 12,
                            ),
                          );
                        },
                      );
                    }
                    if (state is WishlistFailure) {
                      return Center(
                        child: Text(state.message),
                      );
                    }
                    if (wishlistProducts.isEmpty) {
                      return const Center(
                        child: Text('No products in wishlist'),
                      );
                    }

                    return ListView.builder(
                      itemCount: wishlistProducts.length,
                      itemBuilder: (ctx, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: WishlistProductItem(
                          product: wishlistProducts[index],
                          onDelete: () {
                            setState(() {
                              wishlistProducts.removeAt(index);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
