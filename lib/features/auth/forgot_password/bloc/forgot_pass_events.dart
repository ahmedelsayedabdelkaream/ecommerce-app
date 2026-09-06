class ForgotPassEvents {}

class OnEmailChanged extends ForgotPassEvents {
  final String email;
  OnEmailChanged({required this.email});
}

class OnPasswordChanged extends ForgotPassEvents {
  final String password;
  OnPasswordChanged({required this.password});
}

class OnConfirmPasswordChanged extends ForgotPassEvents {
  final String confirmPassword;
  OnConfirmPasswordChanged({required this.confirmPassword});
}

class OnEmailSubmit extends ForgotPassEvents {}

class OnNewPassSubmit extends ForgotPassEvents {
  final String otp;
  OnNewPassSubmit({required this.otp});
}
