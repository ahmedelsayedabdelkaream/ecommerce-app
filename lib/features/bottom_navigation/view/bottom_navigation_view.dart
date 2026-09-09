import 'package:ecommerce_app/features/bottom_navigation/bloc/bottom_nav_bloc.dart';
import 'package:ecommerce_app/features/bottom_navigation/bloc/bottom_nav_events.dart';
import 'package:ecommerce_app/features/bottom_navigation/bloc/bottom_nav_states.dart';
import 'package:ecommerce_app/features/bottom_navigation/widgets/floating_nav.dart';
import 'package:ecommerce_app/features/home/view/home_page.dart';
import 'package:ecommerce_app/shared/routes/app_routes.dart';
import 'package:ecommerce_app/shared/widgets/exit_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
      child: ExitWrapper(
        child: Scaffold(
          body: SafeArea(
            top: false,

            child: BlocBuilder<BottomNavigationBloc, BottomNavigationStates>(
              builder: (context, state) {
                return Stack(
                  children: [
                    IndexedStack(
                      index: state.currIndex,
                      children: [const HomePageView(), const Placeholder()],
                    ),
                    FloatingNavigationBar(
                      currentIndex: state.currIndex,
                      onTap: (index) {
                        if (index == 1) {
                          Navigator.of(context).pushNamed(AppRoutes.cart);
                        } else {
                          context.read<BottomNavigationBloc>().add(
                            BottomNavigationEvent(index),
                          );
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
