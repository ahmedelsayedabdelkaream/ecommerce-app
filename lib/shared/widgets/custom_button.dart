import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final String? text;
  final VoidCallback? onPressed;
  final bool? isLoading;
  const CustomButton({
    super.key,
    this.text,
    required this.onPressed,
    this.child,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      onPressed: onPressed,
      child:
          child ??
          Text(
            text ?? "",
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
    );
  }
}
