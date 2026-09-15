import 'package:equatable/equatable.dart';

enum SplashStatus { initial, loading, navToOnboarding, navToLogin, navToHome }

class SplashStates extends Equatable {
  final SplashStatus? status;

  const SplashStates({this.status = SplashStatus.initial});

  SplashStates copyWith({SplashStatus? status}) =>
      SplashStates(status: status ?? this.status);

  @override
  List<Object?> get props => [status];
}
