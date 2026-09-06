class AuthModel {
  final String message;
  final String accessToken;
  final String refreshToken;

  AuthModel({
    required this.accessToken,
    required this.refreshToken,
    required this.message,
  });
}
