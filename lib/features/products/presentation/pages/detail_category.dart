import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/common/widgets/shimmer_widget.dart';
import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/custom_suffix_icon.dart';
import 'package:digital_dreams_shop/core/common/widgets/search_field.dart';
import 'package:digital_dreams_shop/features/products/presentation/widgets/brand_item.dart';
import 'package:digital_dreams_shop/features/products/presentation/widgets/small_product_item.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/products/presentation/bloc/products_bloc.dart';
import 'package:digital_dreams_shop/features/products/presentation/widgets/small_product_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailCategoryScreen extends StatefulWidget {
  const DetailCategoryScreen({
    super.key,
    required this.category,
    required this.categoryId,
  });

  final String category;
  final String categoryId;

  @override
  State<DetailCategoryScreen> createState() => _DetailCategoryScreenState();
}

class _DetailCategoryScreenState extends State<DetailCategoryScreen> {
  final TextEditingController searchController = TextEditingController();
  final List<Product> productsByCategory = [];
  int currentBrand = -1;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsBloc>(context).add(
      GetAllProductsByCategoryEvent(
        widget.categoryId,
      ),
    );
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
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 24,
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
                    widget.category,
                    style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: AppColor.text,
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
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchField(
                        controller: searchController,
                        onSubmitted: (value) {
                          BlocProvider.of<ProductsBloc>(context).add(
                            SearchProductsByNamePerCategoryEvent(
                              widget.categoryId,
                              value,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(MediaResource.filter),
                        style: IconButton.styleFrom(
                            backgroundColor: AppColor.primary, elevation: 2),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: brands[widget.category]!.length,
                  itemBuilder: (ctx, index) => BrandItem(
                    onTap: () {
                      setState(
                        () {
                          currentBrand = index;
                          context.read<ProductsBloc>().add(
                                GetProductsByBrandPerCategoryEvent(
                                  widget.categoryId,
                                  brands[widget.category]![index]
                                      .toString()
                                      .split('.')
                                      .last
                                      .toUpperCase(),
                                ),
                              );
                        },
                      );
                    },
                    brand: brands[widget.category]![index]
                        .toString()
                        .split('.')
                        .last,
                    isSelected: currentBrand == index,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: BlocConsumer<ProductsBloc, ProductsState>(
                  listener: (context, state) {
                    if (state is ProductsSuccess) {
                      productsByCategory.clear();
                      productsByCategory.addAll(state.products);
                    }
                    if (state is SearchProductsPerCategorySuccess) {
                      productsByCategory.clear();
                      productsByCategory.addAll(state.products);
                    }
                    if (state is GetProductsByBrandPerCategorySuccess) {
                      productsByCategory.clear();
                      productsByCategory.addAll(state.products);
                    }
                  },
                  builder: (context, state) {
                    if (state is ProductsLoading) {
                      return GridView.builder(
                        itemCount: 8,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (ctx, index) {
                          return const SmallProductLoading();
                        },
                      );
                    }
                    if (state is ProductsError) {
                      return Center(
                        child: Text(state.message),
                      );
                    }
                    if (productsByCategory.isEmpty) {
                      return Center(
                        child: Text(
                          'No products found',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColor.text,
                          ),
                        ),
                      );
                    }
                    return GridView.builder(
                      itemCount: productsByCategory.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (ctx, index) => SmallProductItem(
                        product: productsByCategory[index],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
