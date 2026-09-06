import 'package:ecommerce_app/features/auth/forgot_password/bloc/forgot_pass_bloc.dart';
import 'package:ecommerce_app/features/auth/forgot_password/bloc/forgot_pass_events.dart';
import 'package:ecommerce_app/features/auth/forgot_password/bloc/forgot_pass_states.dart';
import 'package:ecommerce_app/shared/routes/app_routes.dart';
import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:ecommerce_app/shared/widgets/custom_button.dart';
import 'package:ecommerce_app/shared/widgets/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final otp = ModalRoute.of(context)!.settings.arguments as String;
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return BlocListener<ForgotPassBloc, ForgotPassStates>(
      listenWhen: (previous, current) {
        return previous.status != current.status;
      },
      listener: (context, state) {
        if (state.status == ForgotPassStatus.successTwo) {
          Navigator.pushNamed(context, AppRoutes.login);
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
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "New Password",
                    style: TextStyle(
                      fontFamily: "Inter",
                      color: AppColors.primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Column(
                      children: [
                        Text(
                          "Your new password must be different\n from previous used passwords.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Inter",
                            color: AppColors.primaryColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  BlocBuilder<ForgotPassBloc, ForgotPassStates>(
                    builder: (context, state) {
                      return CustomTextform(
                        isPassword: true,
                        hint: "enter password",
                        label: "password",
                        controller: newPasswordController,
                        errorMesg: state.passwordError!,
                        onChange: (value) {
                          context.read<ForgotPassBloc>().add(
                            OnPasswordChanged(password: value),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<ForgotPassBloc, ForgotPassStates>(
                    builder: (context, state) {
                      return CustomTextform(
                        isPassword: true,
                        hint: "Confirm Password",
                        label: "Confirm Password",
                        controller: confirmPasswordController,
                        errorMesg: state.confirmPasswordError ?? "",
                        onChange: (value) {
                          context.read<ForgotPassBloc>().add(
                            OnConfirmPasswordChanged(confirmPassword: value),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  BlocBuilder<ForgotPassBloc, ForgotPassStates>(
                    builder: (context, state) {
                      return CustomButton(
                        onPressed: () {
                          context.read<ForgotPassBloc>().add(
                            OnNewPassSubmit(otp: otp),
                          );
                        },
                        child: state.status == ForgotPassStatus.loading
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                "Send",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
