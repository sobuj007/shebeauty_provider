import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? color;
  final HexColor? hexColor;
  final VoidCallback? onPress;
  final double? borderRadiusValue;
  final text;
  const CustomElevatedButton(
      {super.key, this.color, this.onPress, this.hexColor, this.text, this.borderRadiusValue});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      style: ElevatedButton.styleFrom(
        elevation: 0,
          backgroundColor: hexColor ?? color,
          minimumSize: Size(MediaQuery.of(context).size.width, 45),
          maximumSize: Size(MediaQuery.of(context).size.width, 45),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadiusValue ?? 8))),
      onPressed: onPress,
      child: text,
    );
  }
}
