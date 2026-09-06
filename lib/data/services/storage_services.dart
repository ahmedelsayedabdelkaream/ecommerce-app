import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  final SharedPreferences sharedPreferences;

  StorageServices(this.sharedPreferences);

  Future<void> setLanguage(String langCode) =>
      sharedPreferences.setString('lang', langCode);
  String get currentLanguage =>
      sharedPreferences.getString('lang') ?? 'en'; // Default to English
  Future<void> setAccessToken(String accessToken) =>
      sharedPreferences.setString('accessToken', accessToken);
  String get getAccessToken => sharedPreferences.getString('accessToken') ?? '';

  Future<void> setRefreshToken(String refreshToken) =>
      sharedPreferences.setString('refreshToken', refreshToken);
  String get getRefreshToken =>
      sharedPreferences.getString('refreshToken') ?? '';

  Future<void> setIsUserLoggedIn(bool bool) =>
      sharedPreferences.setBool('loggedIn', bool);

  bool get getisUserLoggedIn => sharedPreferences.getBool('loggedIn') ?? false;
  bool getisUserLoggedIn2() {
    return sharedPreferences.getBool('loggedIn') ?? false;
  }

  Future<void> setOnboardingComplete(bool bool) {
    return sharedPreferences.setBool('onboarding', bool);
  }

  bool isOnboardingComplete() {
    return sharedPreferences.getBool('onboarding') ?? false;
  }
}
