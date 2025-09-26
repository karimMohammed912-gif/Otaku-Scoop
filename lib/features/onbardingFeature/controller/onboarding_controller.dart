import 'package:flutter_riverpod/legacy.dart';
import 'package:otaku_scope/core/services/shared_preferences_service.dart';

class OnboardingController extends StateNotifier<bool> {
  OnboardingController() : super(false) {
    _loadOnboardingStatus();
  }

  Future<void> _loadOnboardingStatus() async {
    try {
      final isCompleted = await SharedPreferencesService.isOnboardingCompleted();
      state = isCompleted;
    } catch (e) {
      // If there's an error loading, default to not completed
      state = false;
    }
  }

  Future<void> completeOnboarding() async {
    state = true;
    await SharedPreferencesService.setOnboardingCompleted(true);
  }

  Future<void> resetOnboarding() async {
    state = false;
    await SharedPreferencesService.setOnboardingCompleted(false);
  }
}


