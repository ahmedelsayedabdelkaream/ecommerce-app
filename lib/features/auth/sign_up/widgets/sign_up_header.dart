import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomSignUpHeader extends StatelessWidget {
  final String text1;
  final String text2;
  const CustomSignUpHeader({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Text(
          text1,
          style: TextStyle(
            fontFamily: "Inter",
            color: AppColors.backgroundFormColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Inter",
            color: AppColors.backgroundFormColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
