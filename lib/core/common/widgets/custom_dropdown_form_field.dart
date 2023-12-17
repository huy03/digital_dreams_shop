// import 'package:flutter/material.dart';

// class CustomDropdownFormField extends StatelessWidget {
//   const CustomDropdownFormField({super.key});

//   final InvalidType? invalidType;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField(
//                                 value: _selectedGender,
//                                 validator: (value) {
//                                   if (value == null) {
//                                     return 'Gender is required!';
//                                   }
//                                   return null;
//                                 },
//                                 decoration: InputDecoration(
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                     borderSide: const BorderSide(
//                                       color: AppColor.primary,
//                                       width: 1,
//                                     ),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                     borderSide: const BorderSide(
//                                       color: Color(0xFFE3E3E3),
//                                     ),
//                                   ),
//                                   errorBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                     borderSide:
//                                         const BorderSide(color: AppColor.error),
//                                   ),
//                                   focusedErrorBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                     borderSide:
//                                         const BorderSide(color: AppColor.error),
//                                   ),
//                                   errorStyle: GoogleFonts.poppins(
//                                     fontSize: 12,
//                                   ),
//                                   contentPadding: const EdgeInsets.only(
//                                     top: 18,
//                                     bottom: 12,
//                                     left: 18,
//                                     right: 12,
//                                   ),
//                                   hintText: 'Gender',
//                                   hintStyle: GoogleFonts.poppins(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600,
//                                     color: Color(0xFFB0B0B0).withOpacity(0.9),
//                                   ),
//                                 ),
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black,
//                                 ),
//                                 borderRadius: BorderRadius.circular(18),
//                                 items: Gender.values
//                                     .map(
//                                       (gender) => DropdownMenuItem(
//                                         value: gender,
//                                         child: Text(
//                                           gender.name.toUpperCase(),
//                                         ),
//                                       ),
//                                     )
//                                     .toList(),
//                                 onChanged: (value) {
//                                   if (value == null) {
//                                     return;
//                                   }
//                                   _selectedGender = value;
//                                 },);
//   }
// }
