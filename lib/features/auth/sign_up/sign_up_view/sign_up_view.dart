import 'package:ecommerce_app/features/auth/sign_up/sign_up_bloc/sign_up_bloc.dart';
import 'package:ecommerce_app/features/auth/sign_up/sign_up_bloc/sign_up_events.dart';
import 'package:ecommerce_app/features/auth/sign_up/sign_up_bloc/sign_up_states.dart';
import 'package:ecommerce_app/features/auth/auth_widgets/already_hava_anaccount.dart';
import 'package:ecommerce_app/features/auth/auth_widgets/sign_up_alt.dart';
import 'package:ecommerce_app/features/auth/sign_up/widgets/sign_up_header.dart';
import 'package:ecommerce_app/features/auth/sign_up/widgets/terms_conditions.dart';
import 'package:ecommerce_app/shared/routes/app_routes.dart';
import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:ecommerce_app/shared/widgets/custom_button.dart';
import 'package:ecommerce_app/shared/widgets/custom_textform.dart';
import 'package:ecommerce_app/shared/widgets/exit_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpStates>(
      listenWhen: (previous, current) {
        return previous.status != current.status;
      },
      listener: (context, state) {
        if (state.status == SignUpStatus.error) {
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
        if (state.status == SignUpStatus.successOne) {
          Navigator.pushNamed(
            context,
            AppRoutes.otp,
            arguments: <String, String>{
              "email": state.email,
              "purpose": "verifyEmail",
            },
          );
        }

        if (state.status == SignUpStatus.successTwo) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("success"), duration: Duration(seconds: 1)),
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.login,
            (route) => false,
          );
          context.read<SignUpBloc>().add(ClearSignUpData());
        }
      },
      child: ExitWrapper(
        child: Scaffold(
          backgroundColor: AppColors.backgroundFormColor,
          body: SafeArea(
            top: false,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/images/onboarding1.png",
                      fit: BoxFit.cover,
                      color: AppColors.primaryColor.withAlpha(230),
                      colorBlendMode: BlendMode.srcATop,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 60,
                  child: CustomSignUpHeader(
                    text1: "Create Account",
                    text2:
                        "Fill your information below or reqister\n with your social account",
                  ),
                ),
                Positioned(
                  top: 180,
                  left: 20,
                  right: 20,
                  bottom: 20,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: BlocBuilder<SignUpBloc, SignUpStates>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                SignUpAlt(),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(child: Divider(indent: 40)),
                                    Expanded(
                                      child: Text(
                                        " Or sign up with ",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(child: Divider(endIndent: 40)),
                                  ],
                                ),
                                const SizedBox(height: 20),

                                CustomTextform(
                                  isPassword: false,
                                  hint: "Email",
                                  label: "Email",
                                  keyboardType: TextInputType.emailAddress,
                                  controller: email,
                                  errorMesg: state.emailError ?? "",
                                  onChange: (value) {
                                    context.read<SignUpBloc>().add(
                                      OnEmailChange(email: value),
                                    );
                                  },
                                ),
                                const SizedBox(height: 20),
                                CustomTextform(
                                  isPassword: state.isPasswordVisible,
                                  onPressedIcon: () {
                                    context.read<SignUpBloc>().add(
                                      OnPasswordVisibilityChanged(),
                                    );
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  hint: "Password",
                                  label: "Password",
                                  controller: password,
                                  errorMesg: state.passwordError ?? "",
                                  onChange: (value) {
                                    context.read<SignUpBloc>().add(
                                      OnPasswordChange(password: value),
                                    );
                                  },
                                ),

                                const SizedBox(height: 20),
                                CustomTextform(
                                  isPassword: state.isPasswordVisible2,
                                  onPressedIcon: () {
                                    context.read<SignUpBloc>().add(
                                      OnPasswordVisibilityChanged2(),
                                    );
                                  },
                                  hint: "Confirm Password",
                                  label: "Confirm Password",
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: confirmPassword,
                                  errorMesg: state.confirmPasswordError ?? "",
                                  onChange: (value) {
                                    context.read<SignUpBloc>().add(
                                      OnConfirmPasswordChange(
                                        confirmPassword: value,
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 10),
                                TermsAndConditions(),
                                const SizedBox(height: 10),
                                CustomButton(
                                  child: state.status == SignUpStatus.loading
                                      ? SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 2,
                                          ),
                                        )
                                      : Text(
                                          "Sign Up",
                                          style: TextTheme.of(context)
                                              .headlineMedium!
                                              .copyWith(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),

                                  onPressed: () {
                                    context.read<SignUpBloc>().add(
                                      SignUpButtonPressedEvent(),
                                    );
                                  },
                                ),

                                const SizedBox(height: 15),
                                AlreadyHavaAnaccount(
                                  text1: "Already have an account?",
                                  text2: "Login",
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.login,
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
}
