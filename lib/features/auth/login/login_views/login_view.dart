import 'package:ecommerce_app/core/extensions/l10n_extension.dart';
import 'package:ecommerce_app/features/auth/login/login_bloc/login_bloc.dart';
import 'package:ecommerce_app/features/auth/login/login_bloc/login_states.dart';
import 'package:ecommerce_app/features/auth/login/login_bloc/login_events.dart';
import 'package:ecommerce_app/features/auth/login/widgets/custom_login_header.dart';
import 'package:ecommerce_app/features/auth/auth_widgets/already_hava_anaccount.dart';
import 'package:ecommerce_app/features/auth/auth_widgets/sign_up_alt.dart';
import 'package:ecommerce_app/shared/routes/app_routes.dart';
import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:ecommerce_app/shared/widgets/custom_button.dart';
import 'package:ecommerce_app/shared/widgets/custom_textform.dart';
import 'package:ecommerce_app/shared/widgets/exit_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController email;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    final currentEmail = context.read<LoginBloc>().state.email;
    final currentPassword = context.read<LoginBloc>().state.password;
    email = TextEditingController(text: currentEmail);
    password = TextEditingController(text: currentPassword);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listenWhen: (previous, current) {
        return previous.status != current.status;
      },
      listener: (context, state) {
        if (state.status == LoginStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(state.error, style: TextStyle(color: Colors.white)),
              duration: const Duration(seconds: 3),
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          );
        }
        if (state.status == LoginStatus.success) {
          context.read<LoginBloc>().add(ClearLoginData());
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.bottomNav,
            (route) => false,
          );
        }
      },
      child: ExitWrapper(
        child: AnnotatedRegion(
          value: SystemUiOverlayStyle.light,
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
                      height: 500,
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
                    child: Image.asset(
                      width: 150,
                      height: 150,
                      "assets/images/1786522226990.png",
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 180,
                    child: CustomLoginHeader(
                      text1: "Let's get you Login!",
                      text2: "Welcome back, you've been missed!",
                    ),
                  ),
                  Positioned(
                    top: 300,
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
                          child: BlocBuilder<LoginBloc, LoginStates>(
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
                                          " Or sign in with ",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(child: Divider(endIndent: 40)),
                                    ],
                                  ),
                                  const SizedBox(height: 20),

                                  CustomTextform(
                                    isPassword: false,
                                    hint: "Ex. 1yM0W@example.com",
                                    label: context.l10n.email,
                                    keyboardType: TextInputType.emailAddress,
                                    controller: email,
                                    errorMesg: state.emailError ?? "",
                                    onChange: (value) {
                                      context.read<LoginBloc>().add(
                                        OnEmailChanged(email: value),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  CustomTextform(
                                    keyboardType: TextInputType.visiblePassword,
                                    isPassword: state.isPasswordVisible,
                                    onPressedIcon: () {
                                      context.read<LoginBloc>().add(
                                        OnPasswordVisibilityChanged(),
                                      );
                                    },
                                    hint: "enter your password",
                                    label: context.l10n.password,
                                    controller: password,
                                    errorMesg: state.passwordError ?? "",
                                    onChange: (value) {
                                      context.read<LoginBloc>().add(
                                        OnPasswordChanged(password: value),
                                      );
                                    },
                                  ),
                                  // const SizedBox(height: 15),
                                  Container(
                                    alignment: Alignment.topRight,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        alignment: Alignment.centerRight,
                                        minimumSize: Size.zero,
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          AppRoutes.forgotPassword,
                                        );
                                      },
                                      child: Text(
                                        context.l10n.forgotPassword,
                                        textAlign: TextAlign.end,
                                        style: TextTheme.of(context).bodyLarge!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  CustomButton(
                                    child: state.status == LoginStatus.loading
                                        ? SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 2,
                                            ),
                                          )
                                        : Text(
                                            context.l10n.login,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),

                                    onPressed: () {
                                      context.read<LoginBloc>().add(
                                        OnLoginButtonPressed(),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 15),
                                  AlreadyHavaAnaccount(
                                    text1: "Don't have an account? ",
                                    text2: "Sign Up",
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                        context,
                                        AppRoutes.signup,
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
      ),
    );
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
