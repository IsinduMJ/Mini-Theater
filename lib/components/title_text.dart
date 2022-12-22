import 'package:flutter/material.dart';

import '../utils/colors.dart';

class TitleText extends StatelessWidget {
  const TitleText(
      {required this.title,
      required this.fontSize,
      this.fontWeight = FontWeight.w600,
      this.color = white,
      this.textAlign = TextAlign.left,
      super.key});

  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Poppins_Regular',
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        // height: 1.35,
      ),
      textAlign: textAlign,
    );
  }
}
