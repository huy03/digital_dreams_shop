import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/custom_suffix_icon.dart';
import 'package:digital_dreams_shop/core/common/widgets/search_field.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/new_product_item.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/category.dart';
import 'package:flutter/material.dart';
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
                    const Expanded(child: SearchField()),
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
                height: 25,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (ctx, index) => const NewProductItem(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
