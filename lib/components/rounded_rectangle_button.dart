import 'package:flutter/material.dart';
import 'package:mini_theater/components/body_text.dart';

import '../utils/colors.dart';

class RoundedRectangleButton extends StatelessWidget {
  RoundedRectangleButton({
    required this.bgColor,
    required this.textColor,
    super.key,
  });
  Color bgColor = white;
  Color textColor = black;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: bgColor,
      ),
      child: Center(
        child: BodyText(
          text: 'Overview',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
