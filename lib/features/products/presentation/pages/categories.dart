import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/common/widgets/cart_button.dart';
import 'package:digital_dreams_shop/core/common/widgets/shimmer_widget.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/custom_suffix_icon.dart';
import 'package:digital_dreams_shop/core/common/widgets/search_field.dart';
import 'package:digital_dreams_shop/features/products/presentation/cubit/categories_cubit.dart';
import 'package:digital_dreams_shop/features/products/presentation/widgets/categories_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final TextEditingController searchController = TextEditingController();

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
                    'Categories',
                    style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: AppColor.text,
                    ),
                  ),
                  const SizedBox(
                    width: 43,
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
                      const CartButton(),
                    ],
                  ),
                ],
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
                height: 25,
              ),
              Expanded(
                child: BlocBuilder<CategoriesCubit, CategoriesState>(
                  builder: (context, state) {
                    if (state is CategoriesLoading) {
                      return ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          return const Padding(
                            padding: EdgeInsets.only(bottom: 20.0),
                            child: ShimmerWidget(
                              height: 150,
                              width: double.infinity,
                              radius: 27,
                            ),
                          );
                        },
                      );
                    }
                    if (state is CategoriesFailure) {
                      return Center(
                        child: Text(state.message),
                      );
                    }
                    if (state is CategoriesSuccess) {
                      final categories = state.categories;
                      return ListView.builder(
                        itemCount: categories.length,
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          return CategoriesItem(
                            isEven: index.isEven,
                            image: categories[index].image,
                            category: categories[index].name,
                            totalProducts: categories[index].productCount,
                            onTap: () {
                              context.pushNamed(
                                RouteNames.productByCategory,
                                pathParameters: {
                                  'categoryId': categories[index].id,
                                  'category': categories[index].name,
                                },
                              );
                            },
                          );
                        },
                      );
                    }
                    return const SizedBox();
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
