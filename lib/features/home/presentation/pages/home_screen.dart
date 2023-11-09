import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/features/home/presentation/cubit/coupon_cubit.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/categoriy_button.dart';
import 'package:digital_dreams_shop/core/common/widgets/shimmer_widget.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/new_product_item.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/product_item.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/show_all_button.dart';
import 'package:digital_dreams_shop/features/products/presentation/cubit/categories_cubit.dart';
import 'package:digital_dreams_shop/features/products/presentation/cubit/popular_categories_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';

import 'package:digital_dreams_shop/features/home/presentation/widgets/coupon_item.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/custom_suffix_icon.dart';
import 'package:digital_dreams_shop/core/common/widgets/search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CouponCubit>().fetchAllCoupons();
    context.read<PopularCategoriesCubit>().fetchPopularCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(MediaResource.home),
                        style: IconButton.styleFrom(
                            backgroundColor: AppColor.primary, elevation: 2),
                      ),
                    ),
                    const Spacer(),
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
                Text(
                  'Welcome,',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColor.text,
                  ),
                ),
                Text(
                  'Our Shopping App',
                  style: GoogleFonts.poppins(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: AppColor.textSecondary.withOpacity(0.9),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const SearchField(),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 180,
                  child: BlocBuilder<CouponCubit, CouponState>(
                    builder: (context, state) {
                      if (state is CouponLoading) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (ctx, index) => const ShimmerWidget(
                            height: 180,
                            width: 260,
                            radius: 20,
                          ),
                        );
                      }
                      if (state is CouponError) {
                        return Text(state.message);
                      }
                      if (state is CouponSuccess) {
                        final coupons = state.coupons;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: coupons.length,
                          itemBuilder: (ctx, index) => CouponItem(
                            coupon: coupons[index],
                            onTap: () {},
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
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
                        color: AppColor.text,
                      ),
                    ),
                    const Spacer(),
                    ShowAllButton(
                      text: 'View All',
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                SizedBox(
                  height: 260,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (ctx, index) => const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: NewProductItem(),
                    ),
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
                        color: AppColor.text,
                      ),
                    ),
                    const Spacer(),
                    ShowAllButton(
                      text: 'View All',
                      onPressed: () {
                        context.pushNamed(RouteNames.category);
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocBuilder<PopularCategoriesCubit, PopularCategoriesState>(
                  builder: (context, state) {
                    if (state is PopularCategoriesLoading) {
                      return SizedBox(
                        height: 36,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (ctx, index) => const ShimmerWidget(
                            height: 35,
                            width: 100,
                            radius: 20,
                          ),
                        ),
                      );
                    }
                    if (state is PopularCategoriesFailure) {
                      return Text(state.message);
                    }
                    if (state is PopularCategoriesSuccess) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: state.categories
                            .map((category) => CategoryButton(
                                  content: category.name,
                                  onTap: () {
                                    context.pushNamed(
                                      RouteNames.productByCategory,
                                      pathParameters: {
                                        'categoryId': category.name,
                                        'category': category.name,
                                      },
                                    );
                                  },
                                ))
                            .toList(),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Popular',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.text,
                      ),
                    ),
                    const Spacer(),
                    ShowAllButton(
                      text: 'View All',
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (ctx, index) => const ProductItem(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
