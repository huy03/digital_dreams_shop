import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';
import 'package:digital_dreams_shop/features/profile/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class AddressSheet extends StatelessWidget {
  const AddressSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 30,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: SingleChildScrollView(
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
    );
  }
}
