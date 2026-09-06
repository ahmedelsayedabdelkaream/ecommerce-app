import 'package:ecommerce_app/features/auth/auth_widgets/already_hava_anaccount.dart';
import 'package:ecommerce_app/features/onboarding/onboarding_bloc/onboarding_bloc.dart';
import 'package:ecommerce_app/features/onboarding/onboarding_bloc/onboarding_events.dart';
import 'package:ecommerce_app/features/onboarding/onboarding_bloc/onboarding_state.dart';
import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingBloc = OnBoardingBloc.getInstance(context);
    return BlocListener<OnBoardingBloc, OnBoardingState>(
      listener: (context, state) {
        if (state is OnBoardingNext) {}
        if (state is OnBoardingPrevious) {}
        if (state is OnBoardingFinish) {
          Navigator.pushReplacementNamed(context, '/signup');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.imageColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PageView(
              allowImplicitScrolling: true,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 9,
                      child: Image.asset(
                        "assets/images/onboarding_primary.jpg",
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Flexible(
                            flex: 2,
                            child: Text(
                              "Find fresh groceries",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondaryColor,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: const Text(
                              "anytime, anywhere easy",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),

                          Flexible(
                            flex: 5,
                            child: Center(
                              child: Text(
                                "Get fresh groceries and essentials delivered\n quickly, making shopping simple and convenient",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),

                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onPressed: () {
                          onBoardingBloc.add(OnBoardingFinishEvent());
                        },
                        child: Text(
                          "Let's Get Started",
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.imageColor,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: AlreadyHavaAnaccount(
                        text1: "Already have an account?",
                        text2: "Login",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Floating action buttons to navigate between onboarding steps
        // floatingActionButton: BlocConsumer<OnBoardingBloc, OnBoardingState>(
        //   builder: (context, state) {
        //     return onBoardingBloc.currentIndex == 0 ||
        //             onBoardingBloc.currentIndex == 2
        //         ? FloatingActionButton.extended(
        //             backgroundColor: AppColors.buttonColor,
        //             onPressed: () {
        //               onBoardingBloc.add(OnBoardingNextEvent());
        //             },
        //             label: onBoardingBloc.currentIndex == 2
        //                 ? const Text(
        //                     "Get Started",
        //                     style: TextStyle(color: AppColors.imageColor),
        //                   )
        //                 : const Text("Next"),
        //           )
        //         : Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.only(left: 25.0),
        //                 child: FloatingActionButton(
        //                   backgroundColor: AppColors.buttonColor,
        //                   onPressed: () =>
        //                       onBoardingBloc.add(OnBoardingPreviousEvent()),
        //                   child: Icon(Icons.remove),
        //                 ),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.only(right: 25.0),
        //                 child: FloatingActionButton(
        //                   onPressed: () =>
        //                       onBoardingBloc.add(OnBoardingNextEvent()),
        //                   child: Icon(Icons.add),
        //                 ),
        //               ),
        //             ],
        //           );
        //   },
        //   listener: (context, state) {},
        // ),
        // // Set the location of the floating action buttons to be centered at the bottom of the screen
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
