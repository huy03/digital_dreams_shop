import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';
import 'package:digital_dreams_shop/core/utils/get_vietnam_provinces.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/address.dart';
import 'package:digital_dreams_shop/features/order/presentation/cubit/address_cubit.dart';
import 'package:digital_dreams_shop/features/order/presentation/widgets/address_widgets.dart';
import 'package:digital_dreams_shop/features/order/presentation/widgets/bottom_container_widget.dart';
import 'package:digital_dreams_shop/features/profile/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  int selectedAddress = 0;
  bool isLoading = true;

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
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Address',
                    style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: AppColor.text,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              BlocBuilder<AddressCubit, AddressState>(
                builder: (context, state) {
                  if (state is AddressLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is AddressFail) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  if (state is! AddressesLoaded) {
                    return const Center(
                      child: Text('Something went wrong!'),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.addresses.length,
                      itemBuilder: (ctx, index) {
                        return AddressWidget(
                          key: ValueKey(state.addresses[index].id),
                          address: state.addresses[index],
                          value: index,
                          groupValue: selectedAddress,
                          onChanged: (value) {
                            setState(() {
                              context
                                  .read<AddressCubit>()
                                  .reOrderAddresses(index);
                            });
                          },
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton.icon(
                icon: const Icon(
                  Iconsax.add,
                  color: AppColor.text,
                  weight: 2,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE3E3E3),
                  disabledBackgroundColor: AppColor.primary.withOpacity(0.5),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () async {
                  if (isLoading) {
                    showDialog(
                      context: context,
                      builder: (ctx) => const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primary,
                        ),
                      ),
                    );
                  }

                  final cities = await getCities();

                  if (!mounted) {
                    return;
                  }
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    useSafeArea: true,
                    context: context,
                    builder: (context) => AddressSheet(
                      cities: cities,
                    ),
                  );
                  setState(() {
                    isLoading = false;
                  });
                  if (!isLoading) {
                    context.pop();
                  }
                  // setState(() {});
                },
                label: Text(
                  'Add Address',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppColor.bodyText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
