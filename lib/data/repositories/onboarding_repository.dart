import 'package:ecommerce_app/data/services/storage_services.dart';

class OnboardingRepository {
  final StorageServices storageServices;
  OnboardingRepository({required this.storageServices});

  // Add these to your existing class

  bool shouldShowOnboarding() {
    return !storageServices.isOnboardingComplete();
  }

  Future<void> setOnboardingComplete() {
    return storageServices.setOnboardingComplete(true);
  }
}
