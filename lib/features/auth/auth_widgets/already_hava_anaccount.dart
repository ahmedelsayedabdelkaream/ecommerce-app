import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';

class AlreadyHavaAnaccount extends StatelessWidget {
  final void Function() onPressed;
  final String text1;
  final String text2;
  const AlreadyHavaAnaccount({
    super.key,
    required this.onPressed,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
            minimumSize: Size.zero,
          ),
          child: Text(
            text2,
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: AppColors.secondaryColor,
              color: AppColors.secondaryColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
