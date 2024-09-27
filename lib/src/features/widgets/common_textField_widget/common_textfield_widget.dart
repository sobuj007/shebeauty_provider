import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class CommonTextfieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText, hintText;
  final InkWell? icon;
  final bool? obscureText, readOnly;
  final TextInputType? keyboardType;
  const CommonTextfieldWidget(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.hintText,
      this.icon,
      this.obscureText,
      this.keyboardType, this.readOnly});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        obscureText: obscureText ?? true,
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        readOnly: readOnly ?? false,
        decoration: InputDecoration(
            hintText: hintText ?? '',
            border: InputBorder.none,
            labelText: labelText,
            fillColor: Colors.white,
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.grey2,
              fontFamily: "Roboto",
            ),
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.grey2,
              fontFamily: "Roboto",
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: AppColors.appColor.withOpacity(0.4),
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: AppColors.appColor.withOpacity(0.4),
                width: 1.0,
              ),
            ),
            suffixIcon: icon),
      ),
    );
  }
}

class CommonSearchTextfieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText, hintText;
  final Icon? icon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  const CommonSearchTextfieldWidget(
      {super.key,
      required this.controller,
      this.labelText,
      this.hintText,
      this.icon,
      this.obscureText,
      this.keyboardType,
      this.onChanged,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.deepGrey,
      ),
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
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            prefixIcon: icon),
        onChanged: onChanged,
      ),
    );
  }
}
