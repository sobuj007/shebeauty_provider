import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize, letterSpacing;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const CustomText({super.key, required this.text, this.textColor, this.fontWeight, this.fontSize, this.textAlign, this.letterSpacing, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(text, style:GoogleFonts.roboto(color: textColor, fontWeight: fontWeight, fontSize: fontSize, letterSpacing: letterSpacing ?? 0.0), textAlign: textAlign, maxLines: maxLines ?? 2, overflow: TextOverflow.ellipsis,);
  }
}
class FieldTitleText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final FontStyle? fontStyle;
  final TextAlign? alignment;
  const FieldTitleText(
      {super.key,
      required this.text,
      this.fontWeight,
      this.color,
      this.fontSize,
      this.fontStyle,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment ?? TextAlign.start,
      style: TextStyle(
          color: color.toString().isEmpty
              ? Colors.white
              : color,
          fontWeight:
              fontWeight ?? Theme.of(context).textTheme.displayLarge?.fontWeight,
          fontSize: fontSize ?? 18,
          fontStyle:
              fontStyle ?? Theme.of(context).textTheme.displayLarge?.fontStyle),
    );
  }
}