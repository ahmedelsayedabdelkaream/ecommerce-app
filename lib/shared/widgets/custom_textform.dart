import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomTextform extends StatelessWidget {
  final String hint;
  final String label;
  final bool isPassword;
  final void Function()? onPressedIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String errorMesg;
  final Widget? prefixIcon;
  final Function(String)? onChange;
  const CustomTextform({
    super.key,
    required this.hint,
    required this.label,
    this.keyboardType,
    this.controller,
    this.validator,
    this.errorMesg = "",
    this.onChange,
    this.prefixIcon,
    this.isPassword = false,
    this.onPressedIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 2.0),
          width: double.infinity,
          child: Text(
            label,
            textAlign: TextAlign.start,
            style: TextStyle(color: AppColors.primaryColor),
          ),
        ),
        TextFormField(
          onChanged: onChange,
          obscureText: isPassword,

          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          keyboardType: keyboardType ?? TextInputType.text,
          controller: controller,
          decoration: InputDecoration(
            suffixIconColor: AppColors.primaryColor,
            suffixIcon: keyboardType == TextInputType.visiblePassword
                ? IconButton(
                    onPressed: onPressedIcon,
                    icon: isPassword
                        ? Icon(Icons.visibility)
                        : Icon(Icons.remove_red_eye_outlined),
                  )
                : null,
            contentPadding: const EdgeInsets.all(10.0),
            prefixIcon: prefixIcon,
            errorText: errorMesg.isEmpty ? null : errorMesg,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            fillColor: AppColors.imageColor,
            filled: true,
            hint: Text(hint),
          ),
        ),
      ],
    );
  }
}
