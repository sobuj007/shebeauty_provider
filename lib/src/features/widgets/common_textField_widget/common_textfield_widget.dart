import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class CommonTextfieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText, hintText;
  final InkWell? icon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  const CommonTextfieldWidget({super.key, required this.controller, required this.labelText, required this.hintText, this.icon, this.obscureText, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        obscureText: obscureText ?? true,
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,

        decoration: InputDecoration(
          hintText: hintText ?? '',
            border: InputBorder.none,
            labelText: labelText,
            fillColor: Colors.white,
            labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
                fontFamily: "Roboto"),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: AppColors.grey,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: AppColors.grey,
                width: 1.0,
              ),
            ),
            suffixIcon: icon),
      ),
    );
  }
}
