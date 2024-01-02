import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/features/order/presentation/widgets/order_items_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key, this.index = 0});

  final int index;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: index,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 0,
          leading: const SizedBox(),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
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
                  'My Orders',
                  style: GoogleFonts.poppins(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: AppColor.text,
                  ),
                ),
              ],
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: AppColor.primary,
            labelColor: AppColor.primary,
            unselectedLabelColor: AppColor.text,
            tabs: [
              Tab(
                child: Text(
                  'All',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'To Pay',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'To Ship',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'To Receive',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'To Rate',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 18,
          ),
          child: TabBarView(
            children: [
              OrderItemsList(
                statusTitle: '',
              ),
              OrderItemsList(
                statusTitle: 'orderStatus=To Pay',
              ),
              OrderItemsList(
                statusTitle: 'orderStatus=To Ship',
              ),
              OrderItemsList(
                statusTitle: 'orderStatus=To Receive',
              ),
              OrderItemsList(
                statusTitle: 'orderStatus=To Rate',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
