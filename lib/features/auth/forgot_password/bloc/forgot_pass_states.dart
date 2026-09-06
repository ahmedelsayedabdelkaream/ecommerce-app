import 'package:equatable/equatable.dart';

enum ForgotPassStatus { initial, loading, successOne, successTwo, error }

class ForgotPassStates extends Equatable {
  final String email;
  final String? otp;
  final String emailError;
  final String password;
  final String confirmPassword;
  final String? passwordError;
  final String? confirmPasswordError;
  final ForgotPassStatus status;
  final String? error;
  const ForgotPassStates({
    this.otp,
    this.email = '',
    this.emailError = '',
    this.status = ForgotPassStatus.initial,
    this.error = '',
    this.password = '',
    this.confirmPassword = '',
    this.passwordError = '',
    this.confirmPasswordError = '',
  });
  ForgotPassStates copyWith({
    String? otp,
    String? email,
    String? emailError,
    String? password,
    String? confirmPassword,
    String? error,
    String? passwordError,
    String? confirmPasswordError,
    ForgotPassStatus? status,
  }) {
    return ForgotPassStates(
      otp: otp ?? this.otp,
      email: email ?? this.email,
      emailError: emailError ?? this.emailError,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      error: error ?? this.error,
      passwordError: passwordError ?? this.passwordError,
      confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
    otp,
    email,
    emailError,
    status,
    error,
    password,
    confirmPassword,
    passwordError,
    confirmPasswordError,
  ];
}
