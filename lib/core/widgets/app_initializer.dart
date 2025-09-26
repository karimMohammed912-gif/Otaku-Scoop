import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otaku_scope/core/providers/providers.dart';
import 'package:otaku_scope/features/onboardingFeature/onbarding_view.dart';
import 'package:otaku_scope/features/top_anime/view/top_anime_view.dart';

class AppInitializer extends ConsumerWidget {
  const AppInitializer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOnboardingCompleted = ref.watch(onboardingControllerProvider);

    // Show loading while checking onboarding status
    if (!isOnboardingCompleted) {
      return const OnboardingView();
    }

    // Show main app if onboarding is completed
    return const TopAnimeView();
  }
}
