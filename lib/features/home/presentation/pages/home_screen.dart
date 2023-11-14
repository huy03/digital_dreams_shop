import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/features/home/presentation/cubit/coupon_cubit.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/categoriy_button.dart';
import 'package:digital_dreams_shop/core/common/widgets/shimmer_widget.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/small_product_item.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/product_item.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/show_all_button.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/product/get_popular_products.dart';
import 'package:digital_dreams_shop/features/products/presentation/bloc/products_bloc.dart';
import 'package:digital_dreams_shop/features/products/presentation/cubit/categories_cubit.dart';
import 'package:digital_dreams_shop/features/products/presentation/cubit/popular_categories_cubit.dart';
import 'package:digital_dreams_shop/features/products/presentation/widgets/small_product_loading.dart';

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
  final TextEditingController searchController = TextEditingController();
  final List<Product> newArrivalProducts = [];
  final List<Product> popularProducts = [];

  @override
  void initState() {
    super.initState();
    context.read<CouponCubit>().fetchAllCoupons();
    context.read<PopularCategoriesCubit>().fetchPopularCategories();
    context.read<ProductsBloc>().add(const GetNewArrivalProductsEvent());
    context.read<ProductsBloc>().add(const GetPopularProductsEvent());
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                        onPressed: () {
                          context.pushNamed(RouteNames.cart);
                        },
                      ),
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
              SearchField(
                controller: searchController,
                onSubmitted: (value) {
                  context.pushNamed(
                    RouteNames.search,
                    pathParameters: {
                      'text': value,
                    },
                  );
                  searchController.clear();
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 180,
                        child: BlocBuilder<CouponCubit, CouponState>(
                          builder: (context, state) {
                            if (state is CouponLoading) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (ctx, index) =>
                                    const ShimmerWidget(
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
                        child: BlocConsumer<ProductsBloc, ProductsState>(
                          listener: (context, state) {
                            if (state is NewArrivalProductsSuccess) {
                              newArrivalProducts.clear();
                              newArrivalProducts.addAll(state.products);
                            }
                          },
                          builder: (context, state) {
                            if (state is ProductsLoading) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (ctx, index) => const Padding(
                                  padding: EdgeInsets.only(right: 16.0),
                                  child: SmallProductLoading(),
                                ),
                              );
                            }
                            if (state is ProductsError) {
                              return Text(state.message);
                            }
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: newArrivalProducts.length,
                              itemBuilder: (ctx, index) => Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: SmallProductItem(
                                  product: newArrivalProducts[index],
                                ),
                              ),
                            );
                          },
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
                      BlocBuilder<PopularCategoriesCubit,
                          PopularCategoriesState>(
                        builder: (context, state) {
                          if (state is PopularCategoriesLoading) {
                            return SizedBox(
                              height: 36,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: 3,
                                itemBuilder: (ctx, index) =>
                                    const ShimmerWidget(
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
                                              'categoryId': category.id,
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
                        child: BlocConsumer<ProductsBloc, ProductsState>(
                          listener: (context, state) {
                            if (state is PopularProductsSuccess) {
                              popularProducts.clear();
                              popularProducts.addAll(state.products);
                            }
                          },
                          builder: (context, state) {
                            if (state is ProductsLoading) {
                              return const Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 16),
                                    child: ShimmerWidget(
                                      height: 100,
                                      width: double.infinity,
                                      radius: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 16),
                                    child: ShimmerWidget(
                                      height: 100,
                                      width: double.infinity,
                                      radius: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 16),
                                    child: ShimmerWidget(
                                      height: 100,
                                      width: double.infinity,
                                      radius: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 16),
                                    child: ShimmerWidget(
                                      height: 100,
                                      width: double.infinity,
                                      radius: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 16),
                                    child: ShimmerWidget(
                                      height: 100,
                                      width: double.infinity,
                                      radius: 20,
                                    ),
                                  ),
                                ],
                              );
                            }
                            if (state is ProductsError) {
                              return Text(state.message);
                            }
                            return Column(
                              children: popularProducts
                                  .map(
                                    (product) => ProductItem(
                                      product: product,
                                    ),
                                  )
                                  .toList(),
                            );
                          },
                        ),
                      ),
                    ],
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
