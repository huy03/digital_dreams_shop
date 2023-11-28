import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    super.key,
    required this.product,
    this.quantity = 1,
    required this.imageCover,
  });

  final Product product;
  final int quantity;
  final String imageCover;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 8,
      ),
      child: Slidable(
        key: ValueKey(widget.product.id),
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          extentRatio: 0.25,
          dismissible: DismissiblePane(
            onDismissed: () {
              BlocProvider.of<CartCubit>(context)
                  .removeProduct(productId: widget.product.id);
            },
          ),
          children: [
            CustomSlidableAction(
              backgroundColor: const Color(0xFF8C1600),
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(12),
              onPressed: (context) {
                BlocProvider.of<CartCubit>(context)
                    .removeProduct(productId: widget.product.id);
              },
              child: SvgPicture.asset(
                MediaResource.delete,
                width: 28,
              ),
            ),
          ],
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: AppColor.background,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF969696).withOpacity(0.1),
                offset: const Offset(0, 0),
                blurRadius: 24,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(widget.imageCover),
                      fit: BoxFit.cover,
                    ),
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
                        widget.product.name,
                        style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: AppColor.text,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.product.brand,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.textSecondary,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            currency
                                .format(widget.product.regularPrice)
                                .toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: AppColor.text,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              InkWell(
                                onTap: quantity == 1
                                    ? null
                                    : () {
                                        setState(() {
                                          quantity--;
                                        });
                                        context
                                            .read<CartCubit>()
                                            .decreaseQuantity(
                                                product: widget.product);
                                      },
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                child: Container(
                                  width: 30,
                                  height: 36,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                      color: Color(0xFFEEEEEE)),
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: quantity == 1
                                          ? Colors.grey
                                          : AppColor.text,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 20,
                                height: 36,
                                color: const Color(0xFFEEEEEE),
                                child: Center(
                                  child: Text(
                                    '$quantity',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.text,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    quantity++;
                                  });
                                  context.read<CartCubit>().increaseQuantity(
                                      product: widget.product);
                                },
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                child: Container(
                                  width: 30,
                                  height: 36,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      color: Color(0xFFEEEEEE)),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      color: AppColor.text,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
