import 'package:ecommerce_app/features/splash/bloc/splash_bloc.dart';
import 'package:ecommerce_app/features/splash/bloc/splash_events.dart';
import 'package:ecommerce_app/features/splash/bloc/splash_states.dart';
import 'package:ecommerce_app/shared/routes/app_routes.dart';
import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<SplashBloc>().add(SplashInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashStates>(
      listener: (context, state) {
        if (state.status == SplashStatus.navToOnboarding) {
          Navigator.of(context).pushNamed(AppRoutes.onboarding);
        } else if (state.status == SplashStatus.navToHome) {
          Navigator.of(context).pushNamed(AppRoutes.bottomNav);
        } else if (state.status == SplashStatus.navToLogin) {
          Navigator.of(context).pushNamed(AppRoutes.login);
        }
      },
      child: BlocBuilder<SplashBloc, SplashStates>(
        builder: (context, state) {
          return SafeArea(
            top: false,
            child: Scaffold(
              backgroundColor: AppColors.primaryColor,
              body: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 120,
                      child: Image.asset(
                        "assets/images/1786522226990.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "Grocery",
                      style: Theme.of(context).textTheme.headlineLarge!
                          .copyWith(fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: state.status == SplashStatus.loading
                          ? CircularProgressIndicator()
                          : Container(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
