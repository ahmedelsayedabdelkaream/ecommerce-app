import 'package:ecommerce_app/data/repositories/auth_repository.dart';
import 'package:ecommerce_app/data/repositories/product_repository.dart';
import 'package:ecommerce_app/data/services/storage_services.dart';
import 'package:ecommerce_app/features/auth/forgot_password/bloc/forgot_pass_bloc.dart';
import 'package:ecommerce_app/features/auth/forgot_password/view/forgot_password_view.dart';
import 'package:ecommerce_app/features/auth/forgot_password/view/new_password.dart';
import 'package:ecommerce_app/features/auth/login/login_bloc/login_bloc.dart';
import 'package:ecommerce_app/features/auth/otp/bloc/otp_bloc.dart';
import 'package:ecommerce_app/features/auth/otp/view/otp_view.dart';
import 'package:ecommerce_app/features/auth/login/login_views/login_view.dart';
import 'package:ecommerce_app/features/auth/sign_up/sign_up_view/complete_profile_view.dart';
import 'package:ecommerce_app/features/auth/sign_up/sign_up_view/sign_up_view.dart';
import 'package:ecommerce_app/features/bottom_navigation/view/bottom_navigation_view.dart';
import 'package:ecommerce_app/features/cart/view/cart_view.dart';
import 'package:ecommerce_app/features/home/view/all_items/categories_list.dart';
import 'package:ecommerce_app/features/home/view/all_items/offers_list.dart';
import 'package:ecommerce_app/features/onboarding/onboarding_view.dart';
import 'package:ecommerce_app/features/product/bloc/product_view_bloc.dart';
import 'package:ecommerce_app/features/product/view/product_view.dart';
import 'package:ecommerce_app/features/search/bloc/search_bloc.dart';
import 'package:ecommerce_app/features/search/view/search_page.dart';
import 'package:ecommerce_app/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String signup = '/signup';
  static const String completeProfile = '/completeProfile';
  static const String otp = '/otp';
  static const String login = '/login';
  static const String createNewPassword = '/createNewPassword';
  static const String forgotPassword = '/forgotPassword';
  // ======================= HOME ================================
  static const String bottomNav = '/BottomNavigationView';
  static const String search = "/search";
  static const String productDetails = '/productDetails';
  static const String categoriesList = '/categoriesList';
  static const String specialOffersList = '/specialOffersList';
  static const String cart = '/cart';
  // ===================Routes =============================
  static Map<String, WidgetBuilder> get routes => {
    splash: (context) => const SplashScreen(),
    // ======================ONBOARDING =============================
    onboarding: (context) => const OnBoardingView(),
    // =========================== AUTH =============================
    signup: (context) => const SignUpView(),
    otp: (context) => BlocProvider(
      create: (context) => OtpBloc(context.read<AuthRepository>()),
      child: const OtpView(),
    ),
    completeProfile: (context) => const CompleteProfileView(),
    login: (context) => BlocProvider(
      create: (context) => LoginBloc(
        context.read<AuthRepository>(),
        context.read<StorageServices>(),
      ),
      child: const LoginView(),
    ),
    forgotPassword: (context) => BlocProvider(
      create: (context) => ForgotPassBloc(context.read<AuthRepository>()),
      child: const ForgotPasswordView(),
    ),
    createNewPassword: (context) => BlocProvider(
      create: (context) => ForgotPassBloc(context.read<AuthRepository>()),
      child: const NewPasswordView(),
    ),
    //==================================== HOME ================================
    bottomNav: (context) => const BottomNavigationView(),
    cart: (context) => const Cartview(),
    search: (context) => BlocProvider(
      create: (context) => SearchPageBloc(),
      child: const SearchPage(),
    ),
    productDetails: (context) => BlocProvider(
      create: (context) => ProductViewBloc(context.read<ProductRepository>()),
      child: const ProductView(),
    ),
    categoriesList: (context) => const CategoriesList(),
    specialOffersList: (context) => const SpecialOfferList(),
  };
}
