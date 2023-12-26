import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/custom_suffix_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return badges.Badge(
            position: badges.BadgePosition.topEnd(top: -8, end: -5),
            badgeContent: Text(
              state.cart.cartTotalQuantity.toString(),
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColor.textLight,
              ),
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: AppColor.primary,
              padding: EdgeInsets.all(5),
            ),
            child: CustomSuffixIcon(
              svgImg: MediaResource.cart,
              onPressed: () {
                context.pushNamed(RouteNames.cart);
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
