class LoginEvents {}

class OnEmailChanged extends LoginEvents {
  final String email;
  OnEmailChanged({required this.email});
}

class OnPasswordChanged extends LoginEvents {
  final String password;
  OnPasswordChanged({required this.password});
}

class OnPasswordVisibilityChanged extends LoginEvents {}

class OnLoginButtonPressed extends LoginEvents {}

class ClearLoginData extends LoginEvents {}
