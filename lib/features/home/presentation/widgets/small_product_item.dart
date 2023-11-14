import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/products/presentation/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class SmallProductItem extends StatelessWidget {
  const SmallProductItem({super.key, required this.product, this.onTap});

  final Product product;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        context.pushNamed(
          RouteNames.productDetail,
          extra: product,
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
                  tag: product.id,
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(product.imageCover),
                    fit: BoxFit.cover,
                    width: 170,
                    height: 170,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 4,
                  child: IconButton(
                    onPressed: () {
                      BlocProvider.of<ProductsBloc>(context).add(
                        AddOrRemoveProductWishListEvent(product.id),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Product added to wishlist'),
                          duration: Duration(milliseconds: 500),
                        ),
                      );
                    },
                    icon: SvgPicture.asset(
                      MediaResource.love,
                      width: 22,
                    ),
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
              product.name,
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
            product.category,
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
            currency.format(product.regularPrice).toString(),
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
