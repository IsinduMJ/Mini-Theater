import 'package:flutter/material.dart';

import '../utils/colors.dart';

class BodyText extends StatelessWidget {
  const BodyText(
      {required this.text,
      required this.fontSize,
      this.fontWeight = FontWeight.w500,
      this.color = white,
      this.textAlign = TextAlign.justify,
      super.key});

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Poppins_Regular',
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: 1.4,
        wordSpacing: 1.25,
        letterSpacing: 0.75,
      ),
      textAlign: textAlign,
    );
  }
}
