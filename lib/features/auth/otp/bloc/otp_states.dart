enum OtpStatus { initial, loading, success, error }

class OtpStates {
  final String? email;
  final String? otp;
  final OtpStatus? status;
  final String? error;
  OtpStates({
    this.otp = '',
    this.error = '',
    this.status = OtpStatus.initial,
    this.email = '',
  });

  OtpStates copyWith({
    String? email,
    String? otp,
    String? error,
    OtpStatus? status,
  }) {
    return OtpStates(
      email: email ?? this.email,
      otp: otp ?? this.otp,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }
}
