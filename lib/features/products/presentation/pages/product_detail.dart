import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/custom_suffix_icon.dart';
import 'package:digital_dreams_shop/features/order/data/models/order_item_model.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/order_item.dart';
import 'package:digital_dreams_shop/features/order/presentation/cubit/order_cubit.dart';
import 'package:digital_dreams_shop/features/products/domain/entities/product.dart';
import 'package:digital_dreams_shop/features/products/domain/usecases/product/get_product_by_Id.dart';
import 'package:digital_dreams_shop/features/products/presentation/bloc/products_bloc.dart';
import 'package:digital_dreams_shop/features/products/presentation/widgets/color_button.dart';
import 'package:digital_dreams_shop/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:badges/badges.dart' as badges;
import 'package:uuid/uuid.dart';

final currency = NumberFormat('#,##0', 'vi-VN');
const uuid = Uuid();

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isAddedToWishlist = false;
  int quantity = 1;

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
                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          if (state is CartLoaded) {
                            return badges.Badge(
                              position:
                                  badges.BadgePosition.topEnd(top: -8, end: -5),
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
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Stack(
                children: [
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
                  Positioned(
                    bottom: 12,
                    left: 16,
                    child: BlocBuilder<WishlistCubit, WishlistState>(
                      builder: (context, state) {
                        if (state is WishlistSuccess) {
                          isAddedToWishlist =
                              state.products.contains(widget.product);
                        }
                        if (state is DeleteFromWishlistSuccess) {
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
                                      : const Text(
                                          'Product removed from wishlist'),
                                  duration: const Duration(milliseconds: 500),
                                ),
                              );
                            },
                            icon: isAddedToWishlist
                                ? const Icon(
                                    Iconsax.heart5,
                                    color: AppColor.background,
                                    size: 30,
                                  )
                                : const Icon(
                                    Iconsax.heart,
                                    color: AppColor.background,
                                    size: 30,
                                  ));
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 260,
                    child: Text(
                      widget.product.name,
                      softWrap: true,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColor.text,
                      ),
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
                              },
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                        child: Container(
                          width: 30,
                          height: 36,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              color: Color(0xFFEEEEEE)),
                          child: Center(
                            child: Icon(
                              Icons.remove,
                              color:
                                  quantity == 1 ? Colors.grey : AppColor.text,
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
                        },
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        child: Container(
                          width: 30,
                          height: 36,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
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
                    ignoreGestures: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
                    itemBuilder: (context, _) => const Icon(
                      Iconsax.star1,
                      color: AppColor.star,
                    ),
                    onRatingUpdate: (rating) {},
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
                    widget.product.quantity != 0
                        ? 'Available in stock'
                        : 'Out of stock',
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
                      color: const Color(0xFF000000).withOpacity(0.08),
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
                          ColorButton(
                            color: AppColor.text,
                            onTap: () {},
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ColorButton(
                            color: const Color(0xFFCCCCCC),
                            onTap: () {},
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ColorButton(
                            color: const Color(0xFFCADCA7),
                            onTap: () {},
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ColorButton(
                            color: const Color(0xFFF79F1F),
                            onTap: () {},
                          ),
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
              Text(
                'Rating',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColor.text,
                ),
              ),
              const Spacer(),
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
                    onTap: () {
                      context.read<CartCubit>().addProductToCart(
                            product: widget.product,
                            quantity: quantity,
                            color: 'red',
                          );
                    },
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
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
                                  color: const Color(0xFF9FA29E),
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
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        final List<OrderItemModel> orderItems = [
                          OrderItemModel(
                            id: uuid.v4(),
                            product: widget.product,
                            quantity: quantity,
                            price: widget.product.regularPrice,
                            color: 'red',
                          ),
                        ];
                        context.read<OrderCubit>().addOrderItem(orderItems);
                        context.pushNamed(RouteNames.checkout);
                      },
                      child: Container(
                        width: 93,
                        height: 55,
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: const BorderRadius.only(
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
