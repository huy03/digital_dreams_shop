import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';
import 'package:digital_dreams_shop/features/profile/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class buildSheet extends StatelessWidget {
  const buildSheet({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
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
                TextFormFieldSetting(hintText: 'Name'),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldSetting(hintText: 'Phone number'),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldSetting(hintText: 'Street'),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldSetting(hintText: 'City'),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldSetting(hintText: 'Distric'),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldSetting(hintText: 'Country'),
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
          ),
        ),
      ),
    ]);
  }
}
