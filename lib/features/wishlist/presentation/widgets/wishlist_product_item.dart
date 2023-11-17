import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:digital_dreams_shop/features/wishlist/presentation/widgets/buy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transparent_image/transparent_image.dart';

class WishlistProductItem extends StatelessWidget {
  const WishlistProductItem({
    super.key,
    required this.product,
    required this.onDelete,
  });

  final Product product;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(product.id),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        extentRatio: 0.25,
        dismissible: DismissiblePane(
          onDismissed: () {
            BlocProvider.of<WishlistCubit>(context).removeProduct(product.id);
            onDelete();
          },
        ),
        children: [
          CustomSlidableAction(
            backgroundColor: const Color(0xFF8C1600),
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.circular(12),
            onPressed: (context) {
              BlocProvider.of<WishlistCubit>(context).removeProduct(product.id);
              onDelete();
            },
            child: SvgPicture.asset(
              MediaResource.delete,
              width: 28,
            ),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          context.pushNamed(
            RouteNames.productDetail,
            extra: product,
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: AppColor.background,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF969696).withOpacity(0.1),
                offset: const Offset(0, 1),
                blurRadius: 10,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: Row(
              children: [
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Hero(
                    tag: product.id,
                    child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: NetworkImage(product.imageCover),
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 130,
                            child: Text(
                              product.name,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColor.text,
                              ),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              MediaResource.cart,
                            ),
                            style: IconButton.styleFrom(
                                backgroundColor: Colors.red.withOpacity(0),
                                elevation: 0),
                          ),
                        ],
                      ),
                      Text(
                        product.category,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColor.textSecondary,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RatingBar.builder(
                        itemSize: 19,
                        minRating: 0,
                        initialRating: product.ratingsAverage,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        ignoreGestures: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.only(right: 1),
                        itemBuilder: (context, _) => const Icon(
                          Iconsax.star1,
                          color: Color(0xFFFFC700),
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            currency.format(product.regularPrice).toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: AppColor.text,
                            ),
                          ),
                          const Spacer(),
                          BuyButton(
                            width: 22,
                            height: 34,
                            text: 'Buy',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
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
