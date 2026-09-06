class OtpEvents {}

class OnOtpResend extends OtpEvents {
  final String email;
  final String purpose;
  OnOtpResend({required this.email, required this.purpose});
}

class OnOtpSubmit extends OtpEvents {
  final String email;
  final String otp;
  final String purpose;

  OnOtpSubmit({required this.otp, required this.email, required this.purpose});
}
