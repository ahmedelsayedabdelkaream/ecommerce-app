import 'package:ecommerce_app/data/repositories/auth_repository.dart';
import 'package:ecommerce_app/data/services/storage_services.dart';
import 'package:ecommerce_app/features/splash/bloc/splash_events.dart';
import 'package:ecommerce_app/features/splash/bloc/splash_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvents, SplashStates> {
  StorageServices storageServices;
  AuthRepository authRepository;
  SplashBloc(this.storageServices, this.authRepository)
    : super(SplashStates()) {
    on<SplashInitialEvent>(((event, emit) async {
      emit(state.copyWith(status: SplashStatus.loading));
      await Future.delayed(const Duration(seconds: 4));
      final isOnboardingComplete = storageServices.isOnboardingComplete();
      if (!isOnboardingComplete) {
        return emit(state.copyWith(status: SplashStatus.navToOnboarding));
      }
      final refreshToken = storageServices.getRefreshToken;
      if (refreshToken.isNotEmpty) {
        try {
          await authRepository.refreshAccessToken(refreshToken);
          return emit(state.copyWith(status: SplashStatus.navToHome));
        } catch (e) {
          return emit(state.copyWith(status: SplashStatus.navToLogin));
        }
      }
      emit(state.copyWith(status: SplashStatus.navToLogin));
    }));
  }
}
