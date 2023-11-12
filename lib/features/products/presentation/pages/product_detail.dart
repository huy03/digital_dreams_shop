import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/custom_suffix_icon.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/product/get_product_by_Id.dart';
import 'package:digital_dreams_shop/features/products/presentation/bloc/products_bloc.dart';
import 'package:digital_dreams_shop/features/products/presentation/widgets/colorInkwellBtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

final currency = NumberFormat('#,##0', 'vi-VN');

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Hero(
                tag: widget.product.id,
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(widget.product.imageCover),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.product.name,
                softWrap: true,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColor.text,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.product.brand,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF666666),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  RatingBar.builder(
                    itemSize: 19,
                    initialRating: widget.product.ratingsAverage.toDouble(),
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
                    itemBuilder: (context, _) => const Icon(
                      Iconsax.star1,
                      color: AppColor.star,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '(${widget.product.ratingsQuantity} Review)',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColor.text,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Available in stock',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColor.text,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Color',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColor.text,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 160,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColor.background,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x000000).withOpacity(0.08),
                      offset: const Offset(0, 0),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 11),
                      child: Row(
                        children: [
                          ColorInkwellBtn(colorbg: AppColor.text),
                          const SizedBox(
                            width: 10,
                          ),
                          ColorInkwellBtn(colorbg: Color(0xFFCCCCCC)),
                          const SizedBox(
                            width: 10,
                          ),
                          ColorInkwellBtn(colorbg: Color(0xFFCADCA7)),
                          const SizedBox(
                            width: 10,
                          ),
                          ColorInkwellBtn(colorbg: Color(0xFFF79F1F)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Description',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColor.text,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.product.description,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF666666),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFAAAAAA),
                        ),
                      ),
                      Text(
                        currency.format(widget.product.regularPrice).toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: AppColor.text,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Ink(
                      child: Container(
                        width: 130,
                        height: 55,
                        decoration: BoxDecoration(
                          color: AppColor.background,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF9A9696).withOpacity(0.25),
                              offset: const Offset(0, 5),
                              blurRadius: 13,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/cart_btnbuy.svg'),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Add to cart',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF9FA29E),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Ink(
                      child: Container(
                        width: 93,
                        height: 55,
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF9A9696).withOpacity(0.25),
                              offset: const Offset(0, 5),
                              blurRadius: 13,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 9),
                          child: Row(
                            children: [
                              Text(
                                'Buy now',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.background,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
