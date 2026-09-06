class SignUpEvents {
  const SignUpEvents();
}

class OnNameChange extends SignUpEvents {
  final String name;

  const OnNameChange({required this.name});
}

class OnEmailChange extends SignUpEvents {
  final String email;

  const OnEmailChange({required this.email});
}

class OnPasswordChange extends SignUpEvents {
  final String password;

  const OnPasswordChange({required this.password});
}

class OnConfirmPasswordChange extends SignUpEvents {
  final String confirmPassword;

  const OnConfirmPasswordChange({required this.confirmPassword});
}

class OnImageChange extends SignUpEvents {}

class OnPhoneNumberChange extends SignUpEvents {
  final String phoneNumber;

  const OnPhoneNumberChange({required this.phoneNumber});
}

class OnChangeCountryCode extends SignUpEvents {
  final String countryCode;

  const OnChangeCountryCode({required this.countryCode});
}

class OnGenderChange extends SignUpEvents {
  final String gender;

  const OnGenderChange({required this.gender});
}

class OnPasswordVisibilityChanged extends SignUpEvents {}

class OnPasswordVisibilityChanged2 extends SignUpEvents {}

class ToggleTermsEvent extends SignUpEvents {}

class SignUpButtonPressedEvent extends SignUpEvents {}

class CompleteProfileButtonPressedEvent extends SignUpEvents {}

class ClearSignUpData extends SignUpEvents {}
