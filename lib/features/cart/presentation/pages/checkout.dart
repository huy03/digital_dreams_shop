import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';
import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:digital_dreams_shop/features/cart/presentation/widgets/check_out_item.dart';
import 'package:digital_dreams_shop/features/cart/presentation/widgets/address_information_title.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/custom_suffix_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:badges/badges.dart' as badges;
import 'package:http/http.dart' as http;
import 'dart:convert';

const shipCost = 30000;

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  Map<String, dynamic>? paymentIntent;

  void makePayment(int amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount);

      var gpay = const PaymentSheetGooglePay(
        merchantCountryCode: 'VN',
        currencyCode: 'vnd',
        testEnv: true,
      );
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          googlePay: gpay,
          style: ThemeMode.dark,
          merchantDisplayName: 'Example Inc.',
        ),
      );
      displayPaymentSheet();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      context.pop();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  createPaymentIntent(int amount) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount.toString(),
        'currency': 'vnd',
      };

      http.Response response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          'Authorization':
              'Bearer sk_test_51OIwCIGJQyVtA8BL2TjbFA1j1xJFEJsi3KIEbArRbgsOtMsZV26HYXCrHBnExg5qPxgc6YEVzNHplL7fzdiEsg3m0035DCltQt',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
      return json.decode(response.body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = (context.watch<CartCubit>().state as CartLoaded).cart;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 24,
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
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Checkout',
                    style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF000000),
                    ),
                  ),
                  const SizedBox(
                    width: 61,
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
                      badges.Badge(
                        position: badges.BadgePosition.topEnd(top: -8, end: -5),
                        badgeContent: Text(
                          cart.cartTotalQuantity.toString(),
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
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColor.background,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFE3DBDD).withOpacity(0.25),
                      offset: const Offset(5, 5),
                      blurRadius: 15,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 18,
                  ),
                  child: Column(
                    children: [
                      AddressInformationTitle(
                        title: 'Street: ',
                        value: '28A Nguyen Du',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: AddressInformationTitle(
                          title: 'District: ',
                          value: 'Quan 1',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: AddressInformationTitle(
                          title: 'City: ',
                          value: 'Ho Chi Minh',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: AddressInformationTitle(
                          title: 'Country: ',
                          value: 'Vietnam',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: AddressInformationTitle(
                          title: 'Phone number: ',
                          value: '0398285020',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Home Delivery',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.text,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 310,
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (ctx, index) => CheckoutItem(
                    product: cart.items[index].product,
                    quantity: cart.items[index].quantity,
                    imageCover: cart.items[index].product.imageCover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Row(
                  children: [
                    Text(
                      'Subtotal: ',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColor.checkOutText,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      currency.format(cart.cartTotalPrice).toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColor.text,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Text(
                      'Shipping fee: ',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColor.checkOutText,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      currency.format(shipCost).toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColor.text,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Text(
                      'Subtotal',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.text,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      currency
                          .format(cart.cartTotalPrice + shipCost)
                          .toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.text,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        if (state is CartLoaded) {
                          return Text(
                            'Total: ${currency.format(state.cart.cartTotalPrice + shipCost).toString()}',
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: AppColor.text,
                            ),
                          );
                        }
                        return Text(
                          'Total: 530.000',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: AppColor.text,
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    CustomButton(
                      width: 65,
                      height: 50,
                      text: 'Pay Now',
                      onPressed: () {
                        makePayment(cart.cartTotalPrice + shipCost);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
