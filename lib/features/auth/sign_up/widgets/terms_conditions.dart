import 'package:ecommerce_app/features/auth/sign_up/sign_up_bloc/sign_up_bloc.dart';
import 'package:ecommerce_app/features/auth/sign_up/sign_up_bloc/sign_up_events.dart';
import 'package:ecommerce_app/features/auth/sign_up/sign_up_bloc/sign_up_states.dart';
import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<SignUpBloc, SignUpStates>(
          builder: (context, state) {
            return Checkbox(
              checkColor: Colors.white,
              activeColor: AppColors.secondaryColor,
              side: const BorderSide(width: 2, color: AppColors.secondaryColor),
              isError: state.toggelError!.isNotEmpty,
              value: state.isTermAccepted,
              onChanged: (value) {
                context.read<SignUpBloc>().add(ToggleTermsEvent());
              },
            );
          },
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Accept with ",
                style: TextStyle(
                  fontFamily: "Inter",
                  color: AppColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "Terms and Conditions",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.secondaryColor,
                  fontFamily: "Inter",
                  color: AppColors.secondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
