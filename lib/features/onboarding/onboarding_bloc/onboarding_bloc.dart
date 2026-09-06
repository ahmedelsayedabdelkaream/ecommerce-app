import 'package:ecommerce_app/data/services/storage_services.dart';
import 'package:ecommerce_app/features/onboarding/onboarding_bloc/onboarding_events.dart';
import 'package:ecommerce_app/features/onboarding/onboarding_bloc/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvents, OnBoardingState> {
  static OnBoardingBloc getInstance(BuildContext context) =>
      BlocProvider.of<OnBoardingBloc>(context);
  StorageServices storageServices;
  // bool show = OnboardingRepository.shouldShowOnboarding();
  OnBoardingBloc({required this.storageServices}) : super(OnBoardingInitial()) {
    on<OnBoardingNextEvent>((event, emit) {
      emit(OnBoardingNext());
    });
    on<OnBoardingPreviousEvent>((event, emit) {
      emit(OnBoardingPrevious());
    });
    on<OnBoardingFinishEvent>((event, emit) async {
      await storageServices.setOnboardingComplete(true);
      emit(OnBoardingFinish());
    });
  }
}
