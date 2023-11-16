import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/products/presentation/bloc/products_bloc.dart';
import 'package:digital_dreams_shop/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transparent_image/transparent_image.dart';

class SmallProductItem extends StatefulWidget {
  const SmallProductItem({super.key, required this.product, this.onTap});

  final Product product;
  final void Function()? onTap;

  @override
  State<SmallProductItem> createState() => _SmallProductItemState();
}

class _SmallProductItemState extends State<SmallProductItem> {
  bool isAddedToWishlist = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        context.pushNamed(
          RouteNames.productDetail,
          extra: widget.product,
        );
      },
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                Hero(
                  tag: widget.product.id,
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(widget.product.imageCover),
                    fit: BoxFit.cover,
                    width: 170,
                    height: 170,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 4,
                  child: BlocBuilder<WishlistCubit, WishlistState>(
                    builder: (context, state) {
                      if (state is WishlistSuccess) {
                        isAddedToWishlist =
                            state.products.contains(widget.product);
                      }
                      return IconButton(
                        onPressed: () {
                          BlocProvider.of<WishlistCubit>(context)
                              .addOrRemoveProduct(widget.product.id);

                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: !isAddedToWishlist
                                  ? const Text('Product added to wishlist')
                                  : const Text('Product removed from wishlist'),
                              duration: const Duration(milliseconds: 500),
                            ),
                          );
                        },
                        icon: isAddedToWishlist
                            ? const Icon(
                                Iconsax.heart5,
                                color: AppColor.background,
                              )
                            : SvgPicture.asset(
                                MediaResource.love,
                                width: 22,
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: 140,
            child: Text(
              widget.product.name,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColor.text,
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            widget.product.category,
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: AppColor.textSecondary,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            currency.format(widget.product.regularPrice).toString(),
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: AppColor.text,
            ),
          ),
        ],
      ),
    );
  }
}
