import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function()? onPressed;

  const TextRow({
    super.key,
    required this.text1,
    required this.text2,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style: TextTheme.of(context).headlineLarge?.copyWith(
            color: AppColors.primaryColor,
            fontSize: 20,
          ),
        ),
        Spacer(),
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
