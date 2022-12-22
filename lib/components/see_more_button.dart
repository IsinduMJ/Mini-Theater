import 'package:flutter/material.dart';

import '../utils/colors.dart';

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 27,
        width: 95,
        decoration: BoxDecoration(
          color: white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12.5),
        ),
        child: const Center(
          child: Text(
            'See more...',
            style: TextStyle(color: white, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
