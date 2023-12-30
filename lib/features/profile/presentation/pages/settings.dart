import 'dart:ffi';

import 'package:digital_dreams_shop/config/routes/route_names.dart';
import 'package:digital_dreams_shop/config/theme/colors.dart';
import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/core/common/widgets/custom_button.dart';
import 'package:digital_dreams_shop/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:digital_dreams_shop/features/home/presentation/widgets/custom_suffix_icon.dart';
import 'package:digital_dreams_shop/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:digital_dreams_shop/features/profile/presentation/widgets/custom_dropdown_button.dart';
import 'package:digital_dreams_shop/features/profile/presentation/widgets/text_form_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat('dd/MM/yyyy');

enum Gender { male, female }

class SettingProfile extends StatefulWidget {
  const SettingProfile({super.key});

  @override
  State<SettingProfile> createState() => _SettingProfileState();
}

class _SettingProfileState extends State<SettingProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  Gender? _selectedGender;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    birthDateController.dispose();
    super.dispose();
  }

  void submit() async {
    final isValidate = _formKey.currentState!.validate();
    if (isValidate) {
      await BlocProvider.of<ProfileCubit>(context).updateProfile(
        username: nameController.text,
        email: emailController.text,
        phoneNumber: phoneController.text,
        gender: _selectedGender!.name,
        birthday: birthDateController.text,
      );
    }
  }

  void _showDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColor.primary, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            dialogBackgroundColor: Colors.white, // DatePicker background color
          ),
          child: child!,
        );
      },
    );

    if (pickedDate == null) {
      return;
    }

    birthDateController.text = formatter.format(pickedDate);
  }

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
                        BlocProvider.of<ProfileCubit>(context).loadProfile();
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
                    'Profile',
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
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: BlocConsumer<ProfileCubit, ProfileState>(
                      listener: (context, state) {
                        if (state is ProfileError) {
                          BlocProvider.of<ProfileCubit>(context).loadProfile();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.message),
                            ),
                          );
                        }
                        if (state is ProfileUpdated) {
                          context.pop();
                        }
                      },
                      builder: (context, state) {
                        if (state is ProfileLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is! ProfileLoaded) {
                          return const Center(
                            child: Text('Error'),
                          );
                        }

                        nameController.value =
                            TextEditingValue(text: state.user.userName);
                        emailController.value =
                            TextEditingValue(text: state.user.email);
                        phoneController.value =
                            TextEditingValue(text: state.user.phoneNumber);
                        birthDateController.value = state.user.birthDate == null
                            ? const TextEditingValue(text: '')
                            : TextEditingValue(text: state.user.birthDate!);

                        if (state.user.gender != null) {
                          _selectedGender = Gender.values
                              .where((gender) =>
                                  gender.name ==
                                  state.user.gender!.toLowerCase())
                              .first;
                        }

                        return Column(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                  image: NetworkImage(state.user.avatar!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormFieldSetting(
                              controller: nameController,
                              hintText: 'Username',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormFieldSetting(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              hintText: 'Email',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email is required!';
                                }
                                if (!EmailValidator.validate(value)) {
                                  return 'Please enter a valid email!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormFieldSetting(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              hintText: 'Phone Number',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Phone number is required!';
                                }
                                var regExp =
                                    RegExp(r'^(?:[+0][1-9])?[0-9]{10}$');
                                if (!regExp.hasMatch(value)) {
                                  return 'Please enter a valid phone number!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomDropdownButton(
                              value: _selectedGender,
                              hintText: 'Gender',
                              validator: (value) {
                                if (value == null) {
                                  return 'Gender is required!';
                                }
                                return null;
                              },
                              items: Gender.values
                                  .map(
                                    (gender) => DropdownMenuItem(
                                      value: gender,
                                      child: Text(
                                        gender.name.toUpperCase(),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                if (value == null) {
                                  return;
                                }
                                _selectedGender = value;
                              },
                            ),
                            // DropdownButtonFormField(
                            //   value: _selectedGender,
                            //   validator: (value) {
                            //     if (value == null) {
                            //       return 'Gender is required!';
                            //     }
                            //     return null;
                            //   },
                            //   decoration: InputDecoration(
                            //     focusedBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(12),
                            //       borderSide: const BorderSide(
                            //         color: AppColor.primary,
                            //         width: 1,
                            //       ),
                            //     ),
                            //     enabledBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(12),
                            //       borderSide: const BorderSide(
                            //         color: Color(0xFFE3E3E3),
                            //       ),
                            //     ),
                            //     errorBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(8),
                            //       borderSide:
                            //           const BorderSide(color: AppColor.error),
                            //     ),
                            //     focusedErrorBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(8),
                            //       borderSide:
                            //           const BorderSide(color: AppColor.error),
                            //     ),
                            //     errorStyle: GoogleFonts.poppins(
                            //       fontSize: 12,
                            //     ),
                            //     contentPadding: const EdgeInsets.only(
                            //       top: 18,
                            //       bottom: 12,
                            //       left: 18,
                            //       right: 12,
                            //     ),
                            //     hintText: 'Gender',
                            //     hintStyle: GoogleFonts.poppins(
                            //       fontSize: 14,
                            //       fontWeight: FontWeight.w600,
                            //       color: Color(0xFFB0B0B0).withOpacity(0.9),
                            //     ),
                            //   ),
                            //   style: GoogleFonts.poppins(
                            //     fontSize: 14,
                            //     fontWeight: FontWeight.w500,
                            //     color: Colors.black,
                            //   ),
                            //   borderRadius: BorderRadius.circular(18),
                            //   items: Gender.values
                            //       .map(
                            //         (gender) => DropdownMenuItem(
                            //           value: gender,
                            //           child: Text(
                            //             gender.name.toUpperCase(),
                            //           ),
                            //         ),
                            //       )
                            //       .toList(),
                            //   onChanged: (value) {
                            //     if (value == null) {
                            //       return;
                            //     }
                            //     _selectedGender = value;
                            //   },
                            // ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormFieldSetting(
                              controller: birthDateController,
                              hintText: 'Date of Birth',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Date of birth is required!';
                                }

                                return null;
                              },
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Iconsax.calendar_1,
                                  color: Colors.black,
                                ),
                                onPressed: _showDatePicker,
                              ),
                            ),
                            const SizedBox(
                              height: 45,
                            ),
                            CustomButton(
                              width: double.infinity,
                              height: 45,
                              text: 'Save',
                              onPressed: submit,
                            ),
                          ],
                        );
                      },
                    ),
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
