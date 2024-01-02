import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/order_item.dart';
import 'package:digital_dreams_shop/features/order/presentation/cubit/product_rate_cubit.dart';
import 'package:digital_dreams_shop/features/products/presentation/cubit/review_cubit.dart';
import 'package:digital_dreams_shop/features/profile/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transparent_image/transparent_image.dart';

class ReviewProductItem extends StatefulWidget {
  const ReviewProductItem({super.key, required this.item});

  final OrderItem item;

  @override
  State<ReviewProductItem> createState() => _ReviewProductItemState();
}

class _ReviewProductItemState extends State<ReviewProductItem> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _reviewController = TextEditingController();
  double rating = 0;

  @override
  void dispose() {
    super.dispose();
    _reviewController.dispose();
  }

  void submit() {
    final isValidate = _formKey.currentState!.validate();
    if (isValidate) {
      context.read<ReviewCubit>().createProductReview(
        widget.item.product.id,
        {
          'rating': rating,
          'comment': _reviewController.text,
        },
      );
      context.read<ProductRateCubit>().removeRateProduct(widget.item);
      _reviewController.text = '';
      rating = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 0,
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(
                    widget.item.product.imageCover,
                  ),
                  fit: BoxFit.cover,
                  width: 56,
                  height: 56,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.item.product.name,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF313131),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.item.product.category,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFC2BFBF),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'x${widget.item.quantity}',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFC2BFBF),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        currency.format(widget.item.product.regularPrice),
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF313131),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Product Quantity',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColor.text,
                ),
              ),
              RatingBar.builder(
                itemSize: 20,
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
                itemBuilder: (context, _) => const Icon(
                  Iconsax.star1,
                  color: AppColor.star,
                ),
                onRatingUpdate: (value) {
                  rating = value;
                },
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Form(
            key: _formKey,
            child: TextFormFieldSetting(
              controller: _reviewController,
              hintText: 'Share some thoughts on the product.',
              maxLines: 6,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter some reviews!';
                }
                return null;
              },
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              width: 120,
              height: 34,
              child: ElevatedButton(
                onPressed: submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColor.textLight,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
