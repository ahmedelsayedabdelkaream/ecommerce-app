class OnBoardingState {
  final int currentIndex;
  OnBoardingState({this.currentIndex = 0});
}

class OnBoardingInitial extends OnBoardingState {}

class OnBoardingNext extends OnBoardingState {}

class OnBoardingPrevious extends OnBoardingState {}

class OnBoardingFinish extends OnBoardingState {}
