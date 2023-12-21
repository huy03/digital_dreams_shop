import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/core/common/models/city.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';
import 'package:digital_dreams_shop/core/utils/get_vietnam_provinces.dart';
import 'package:digital_dreams_shop/features/order/data/models/address_model.dart';
import 'package:digital_dreams_shop/features/order/domain/entities/address.dart';
import 'package:digital_dreams_shop/features/order/presentation/cubit/address_cubit.dart';
import 'package:digital_dreams_shop/features/profile/presentation/widgets/custom_dropdown_button.dart';
import 'package:digital_dreams_shop/features/profile/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class AddressSheet extends StatefulWidget {
  const AddressSheet({super.key, required this.cities});

  final List<City> cities;

  @override
  State<AddressSheet> createState() => _AddressSheetState();
}

class _AddressSheetState extends State<AddressSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _streetController = TextEditingController();
  final _countryController = TextEditingController();
  City? _selectedCity;
  List<String> districts = [];
  String? _selectedDistrict;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
  }

  void submit() async {
    final isValidate = _formKey.currentState!.validate();
    if (isValidate) {
      context.read<AddressCubit>().addAddress(
            AddressModel(
              id: uuid.v4(),
              customer: _nameController.text,
              phoneNumber: _phoneNumberController.text,
              country: _countryController.text,
              city: _selectedCity!.name,
              district: _selectedDistrict!,
              detailedAddress: _streetController.text,
            ),
          );
      if (!mounted) {
        return;
      }
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;
    _countryController.text = 'Vietnam';

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          30,
          30,
          30,
          keyBoardSpace + 16,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormFieldSetting(
                  controller: _nameController,
                  hintText: 'Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldSetting(
                  controller: _phoneNumberController,
                  hintText: 'Phone number',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is required!';
                    }
                    var regExp = RegExp(r'^(?:[+0][1-9])?[0-9]{10}$');
                    if (!regExp.hasMatch(value)) {
                      return 'Please enter a valid phone number!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldSetting(
                  controller: _countryController,
                  hintText: 'Country',
                  enabled: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomDropdownButton(
                  value: _selectedCity,
                  hintText: 'City',
                  items: widget.cities
                      .map(
                        (city) => DropdownMenuItem(
                          value: city,
                          child: Text(city.name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCity = value;
                      districts = _selectedCity!.districts;
                      _selectedDistrict = null;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'City is required!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomDropdownButton(
                  value: _selectedDistrict,
                  hintText: 'District',
                  items: districts
                      .map(
                        (district) => DropdownMenuItem(
                          value: district,
                          child: Text(district),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedDistrict = value.toString();
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'District is required!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldSetting(
                    controller: _streetController,
                    hintText: 'Street',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Street is required!';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  width: double.infinity,
                  height: 45,
                  text: 'Save',
                  onPressed: submit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
