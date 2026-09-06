import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, success, error }

class LoginStates extends Equatable {
  final LoginStatus status;
  final String email;
  final String password;
  final bool isPasswordVisible;
  final String error;
  final String? emailError;
  final String? passwordError;
  const LoginStates({
    this.status = LoginStatus.initial,
    this.email = '',
    this.password = '',
    this.error = '',
    this.emailError = '',
    this.passwordError = '',
    this.isPasswordVisible = true,
  });

  LoginStates copyWith({
    LoginStatus? status,
    String? email,
    String? password,
    bool? isPasswordVisible,
    String? error,
    String? emailError,
    String? passwordError,
  }) {
    return LoginStates(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      error: error ?? this.error,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [
    status,
    email,
    password,
    error,
    emailError,
    passwordError,
    isPasswordVisible,
  ];
}

class LoginInitialState extends LoginStates {}
