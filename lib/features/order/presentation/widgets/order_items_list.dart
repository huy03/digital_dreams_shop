import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/features/order/presentation/cubit/order_cubit.dart';
import 'package:digital_dreams_shop/features/order/presentation/widgets/order_history_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

const status = {
  'To Pay': {'name': 'Pending', 'color': Color(0xFFFFA500)},
  'To Ship': {'name': 'Preparing', 'color': Color(0xFFFFCA0D)},
  'To Receive': {'name': 'Shipping', 'color': Color(0xFF0082FB)},
  'To Rate': {'name': 'Completed', 'color': Color(0xFF0AFF14)}
};

class OrderItemsList extends StatefulWidget {
  const OrderItemsList({super.key, required this.statusTitle});

  final String statusTitle;

  @override
  State<OrderItemsList> createState() => _OrderItemsListState();
}

class _OrderItemsListState extends State<OrderItemsList> {
  @override
  void initState() {
    super.initState();
    context.read<OrderCubit>().fetchAllOrders(widget.statusTitle);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state.orderStatus == OrderStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.primary,
            ),
          );
        }
        if (state.orderStatus == OrderStatus.error) {
          return Text(state.errorMessage);
        }
        if (state.orderStatus == OrderStatus.initial) {
          return const SizedBox();
        }
        if (state.orders.isEmpty) {
          return Center(
            child: Text(
              'No orders here!',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
        return ListView.builder(
          itemCount: state.orders.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 18),
              padding: const EdgeInsets.all(16),
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text(
                        '#${state.orders[index].id}',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF313131),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (status['${state.orders[index].orderStatus}']![
                                  'color'] as Color)
                              .withOpacity(0.05),
                        ),
                        child: Text(
                          status['${state.orders[index].orderStatus}']!['name']
                              as String,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color:
                                status['${state.orders[index].orderStatus}']![
                                    'color'] as Color,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        state.orders[index].shippingAddress.customer,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColor.text,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        state.orders[index].shippingAddress.phoneNumber,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFA9A6A6),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    '${state.orders[index].shippingAddress.detailedAddress}, ${state.orders[index].shippingAddress.district}, ${state.orders[index].shippingAddress.city}, ${state.orders[index].shippingAddress.country}',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFA9A6A6),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.orders[index].items.length,
                    itemBuilder: (ctx, idx) => OrderHistoryItem(
                      item: state.orders[index].items[idx],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        'Total quantity: ',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFA9A6A6),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${state.orders[index].totalQuantity}',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.text,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        'Shipping price: ',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFA9A6A6),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        currency.format(state.orders[index].shippingPrice),
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.text,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        'Total price: ',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFA9A6A6),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        currency.format(state.orders[index].totalPrice),
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.text,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        'Payment method: ',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFA9A6A6),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        state.orders[index].paymentMethod,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.text,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
