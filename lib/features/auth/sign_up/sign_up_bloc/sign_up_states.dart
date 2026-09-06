import 'dart:io';

import 'package:equatable/equatable.dart';

enum SignUpStatus { initial, loading, successOne, successTwo, error }

class SignUpStates extends Equatable {
  final String userId;
  final String email;
  final String password;
  final String confirmPassword;
  final String name;
  final String gender;
  final File? image;
  final SignUpStatus status; // add status
  final String? error;
  final String? nameError;
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;
  final bool isTermAccepted;
  final String? toggelError;
  final String? phoneNumberError;
  final String? genderError;
  final String? countryCode;
  final String? phoneNumber;
  final bool isPasswordVisible;
  final bool isPasswordVisible2;
  const SignUpStates({
    this.userId = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.name = '',
    this.gender = '',
    this.error = '',
    this.isTermAccepted = false,
    this.status = SignUpStatus.initial,
    this.nameError = '',
    this.emailError = '',
    this.passwordError = '',
    this.confirmPasswordError = '',
    this.toggelError = '',
    this.countryCode = "+1",
    this.phoneNumber = '',
    this.phoneNumberError = '',
    this.genderError = '',
    this.isPasswordVisible = true,
    this.isPasswordVisible2 = true,
    this.image,
  });

  SignUpStates copyWith({
    String? userId,
    String? email,
    String? password,
    String? name,
    String? confirmPassword,
    String? gender,
    SignUpStatus? status,
    String? error,
    String? nameError,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    String? toggelError,
    String? phoneNumberError,
    String? genderError,
    bool? isTermAccepted,
    String? countryCode,
    String? phoneNumber,
    bool? isPasswordVisible,
    bool? isPasswordVisible2,
    File? image,
  }) {
    return SignUpStates(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      status: status ?? this.status,
      error: error ?? this.error,
      isTermAccepted: isTermAccepted ?? this.isTermAccepted,
      nameError: nameError ?? this.nameError,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
      toggelError: toggelError ?? this.toggelError,
      phoneNumberError: phoneNumberError ?? this.phoneNumberError,
      genderError: genderError ?? this.genderError,
      countryCode: countryCode ?? this.countryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isPasswordVisible2: isPasswordVisible2 ?? this.isPasswordVisible2,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [
    userId,
    email,
    password,
    name,
    error,
    status,
    isTermAccepted,
    nameError,
    emailError,
    passwordError,
    toggelError,
    countryCode,
    phoneNumber,
    confirmPassword,
    gender,
    genderError,
    phoneNumberError,
    isPasswordVisible,
    isPasswordVisible2,
    image,
  ];
}

class SignUpInitialState extends SignUpStates {
  const SignUpInitialState();
}

class SignUpSuccessState extends SignUpStates {
  const SignUpSuccessState();
}
