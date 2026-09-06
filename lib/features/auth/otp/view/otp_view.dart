import 'package:ecommerce_app/features/auth/otp/bloc/otp_bloc.dart';
import 'package:ecommerce_app/features/auth/otp/bloc/otp_events.dart';
import 'package:ecommerce_app/features/auth/otp/bloc/otp_states.dart';
import 'package:ecommerce_app/features/auth/otp/otp_wigets/otp_fields.dart';
import 'package:ecommerce_app/shared/routes/app_routes.dart';
import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;

    return BlocListener<OtpBloc, OtpStates>(
      listener: (context, state) {
        if (state.status == OtpStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(
                state.error!,
                style: TextStyle(color: Colors.white),
              ),
              duration: const Duration(seconds: 3),
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          );
        }
        if (state.status == OtpStatus.success) {
          if (arg["purpose"] == "verifyEmail") {
            Navigator.pushNamed(context, AppRoutes.completeProfile);
          } else {
            Navigator.pushNamed(
              context,
              AppRoutes.createNewPassword,
              arguments: state.otp,
            );
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.imageColor, // Keeps the background cream
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              style: ButtonStyle(
                elevation: WidgetStatePropertyAll(1.5),
                shadowColor: WidgetStatePropertyAll(Colors.black),
                backgroundColor: WidgetStatePropertyAll(Colors.white),
                shape: WidgetStatePropertyAll(CircleBorder()),
              ),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Verfiy Code",
                      style: TextStyle(
                        fontFamily: "Inter",
                        color: AppColors.primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Column(
                        children: [
                          Text(
                            "Enter the verification code sent to ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: AppColors.primaryColor,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            arg["email"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: AppColors.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    BlocBuilder<OtpBloc, OtpStates>(
                      builder: (context, state) => OtpFields(
                        onCompleted: (pin) {
                          context.read<OtpBloc>().add(
                            OnOtpSubmit(
                              otp: pin,
                              email: arg["email"],
                              purpose: arg["purpose"],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    Column(
                      children: [
                        Text(
                          "Didn't receive the code?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Inter",
                            color: AppColors.primaryColor,
                            fontSize: 14,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context.read<OtpBloc>().add(
                              OnOtpResend(
                                email: arg["email"],
                                purpose: arg["purpose"],
                              ),
                            );
                          },
                          child: Text(
                            "Resend Code",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: AppColors.secondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.combine([
                                TextDecoration.underline,
                              ]),
                              decorationColor: AppColors.secondaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
