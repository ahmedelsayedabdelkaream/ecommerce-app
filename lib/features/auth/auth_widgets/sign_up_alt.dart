import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class SignUpAlt extends StatelessWidget {
  const SignUpAlt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          style: ButtonStyle(
            side: WidgetStatePropertyAll(
              BorderSide(color: AppColors.backgroundFormColor, width: 2),
            ),
            minimumSize: WidgetStatePropertyAll(Size(60, 60)),
          ),
          onPressed: () async {},
          icon: Image.asset(
            width: 30,
            height: 30,
            "assets/images/icons8-google-48.png",
          ),
        ),
        IconButton(
          style: ButtonStyle(
            side: WidgetStatePropertyAll(
              BorderSide(color: AppColors.backgroundFormColor, width: 2),
            ),
            minimumSize: WidgetStatePropertyAll(Size(60, 60)),
          ),
          onPressed: () {},
          icon: Image.asset(
            width: 25,
            height: 25,
            "assets/images/icons8-facebook-48.png",
          ),
        ),
        IconButton(
          style: ButtonStyle(
            side: WidgetStatePropertyAll(
              BorderSide(color: AppColors.backgroundFormColor, width: 2),
            ),
            minimumSize: WidgetStatePropertyAll(Size(60, 60)),
          ),
          onPressed: () {},
          icon: const Icon(Icons.apple, color: Colors.black),
        ),
      ],
    );
  }
}
