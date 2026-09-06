import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpFields extends StatelessWidget {
  final void Function(String)? onCompleted;
  const OtpFields({super.key, this.onCompleted});

  @override
  Widget build(BuildContext context) {
    final pinPutTheme = PinTheme(
      width: 60,
      height: 50,
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        color: AppColors.imageColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[300]!),
      ),
    );
    return Pinput(
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      preFilledWidget: Text("-"),
      length: 4, // Number of digits
      defaultPinTheme: pinPutTheme,
      // Look when a box is clicked:
      focusedPinTheme: pinPutTheme.copyWith(
        decoration: pinPutTheme.decoration!.copyWith(
          border: Border.all(color: Colors.black),
        ),
      ),
      // This triggers automatically when the 4th digit is typed!
      onCompleted: onCompleted,
    );
  }
}
