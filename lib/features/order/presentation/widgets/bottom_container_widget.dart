import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';
import 'package:digital_dreams_shop/features/profile/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class BottomContainerWidget extends StatelessWidget {
  const BottomContainerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.background,
        boxShadow: [
          BoxShadow(
              color: const Color(0xff464646).withOpacity(0.1),
              offset: const Offset(
                0,
                -4,
              ),
              blurRadius: 24.0,
              spreadRadius: 0)
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 30,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 31),
            child: Column(
              children: [
                TextFormFieldSetting(content: 'Name'),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldSetting(content: 'Phone number'),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldSetting(content: 'Street'),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldSetting(content: 'City'),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldSetting(content: 'Distric'),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldSetting(content: 'Country'),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                      width: double.infinity,
                      height: 45,
                      text: 'Save',
                      onPressed: () {},
                    ),
              ],
            ),
          )),
    );
  }
}
