import 'package:flutter/material.dart';

class CustomLoginHeader extends StatelessWidget {
  final String text1;
  final String text2;
  const CustomLoginHeader({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        spacing: 15,
        children: [
          Text(text1, style: TextTheme.of(context).headlineLarge!),
          Text(
            text2,
            textAlign: TextAlign.center,
            style: TextTheme.of(context).headlineMedium!.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
