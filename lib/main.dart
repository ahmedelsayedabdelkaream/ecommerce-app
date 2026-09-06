import 'package:ecommerce_app/core/bloc_observer.dart';
import 'package:ecommerce_app/data/repositories/auth_repository.dart';
import 'package:ecommerce_app/data/repositories/cart_repository.dart';
import 'package:ecommerce_app/data/repositories/onboarding_repository.dart';
import 'package:ecommerce_app/data/repositories/product_repository.dart';
import 'package:ecommerce_app/data/services/api_service.dart';
import 'package:ecommerce_app/data/services/storage_services.dart';
import 'package:ecommerce_app/features/auth/sign_up/sign_up_bloc/sign_up_bloc.dart';
import 'package:ecommerce_app/features/bottom_navigation/bloc/bottom_nav_bloc.dart';
import 'package:ecommerce_app/features/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app/features/home/bloc/home_page_bloc.dart';
import 'package:ecommerce_app/features/onboarding/onboarding_bloc/onboarding_bloc.dart';
import 'package:ecommerce_app/l10n/app_localizations.dart';
import 'package:ecommerce_app/shared/localization/locale_bloc.dart';
import 'package:ecommerce_app/shared/routes/app_routes.dart';
import 'package:ecommerce_app/shared/themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  Bloc.observer = AppBlocObserver();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  StorageServices storageServices = StorageServices(sharedPreferences);
  String initialRoute = storageServices.isOnboardingComplete()
      ? storageServices.getisUserLoggedIn2()
            ? AppRoutes.bottomNav
            : AppRoutes.login
      : AppRoutes.onboarding;
  runApp(MyApp(storageServices: storageServices, initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final StorageServices storageServices;
  final String? initialRoute;
  const MyApp({super.key, required this.storageServices, this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: storageServices),
        RepositoryProvider(
          create: (context) => ApiService(context.read<StorageServices>()),
        ),
        RepositoryProvider(
          create: (context) => OnboardingRepository(
            storageServices: context.read<StorageServices>(),
          ),
        ),
        RepositoryProvider(
          create: (context) => AuthRepository(
            context.read<ApiService>(),
            context.read<StorageServices>(),
          ),
        ),
        RepositoryProvider(
          create: (context) => ProductRepository(context.read<ApiService>()),
        ),
        RepositoryProvider(
          create: (context) => CartRepository(context.read<ApiService>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => OnBoardingBloc(
              storageServices: context.read<StorageServices>(),
            ),
          ),
          BlocProvider(
            create: (context) => LocaleBloc(context.read<StorageServices>()),
          ),
          BlocProvider(
            create: (context) => SignUpBloc(context.read<AuthRepository>()),
          ),
          BlocProvider(create: (context) => BottomNavigationBloc()),
          BlocProvider(
            create: (context) =>
                HomePageBloc(context.read<ProductRepository>()),
          ),
          BlocProvider(
            create: (context) => CartBloc(context.read<CartRepository>()),
          ),
        ],
        child: BlocBuilder<LocaleBloc, LocaleState>(
          builder: (context, state) {
            return MaterialApp(
              locale: state.locale,
              initialRoute: initialRoute,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: AppTextThemes.lightTextTheme,
                useMaterial3: true,
                colorSchemeSeed: Colors.blue,
                fontFamily: "Inter",
              ),
              routes: AppRoutes.routes,
            );
          },
        ),
      ),
    );
  }
}
