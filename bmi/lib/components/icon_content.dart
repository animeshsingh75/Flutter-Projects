import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData? icon;
  final String label;
  const IconContent({super.key, this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
