import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:otaku_scope/core/providers/providers.dart';
import 'package:otaku_scope/features/onboardingFeature/widgets/onbarding_pages.dart';
import 'package:otaku_scope/features/onboardingFeature/widgets/page_indicator.dart';
import 'package:go_router/go_router.dart';
import 'package:otaku_scope/features/onboardingFeature/model/onbarding_model.dart';

final currentPageProvider = StateProvider<int>((ref) => 0);

final List<OnboardingPageModel> onboardingPages = [
  OnboardingPageModel(
    title: 'Welcome to Otaku Scope!',
    description:
        'Your ultimate app for discovering and tracking anime and manga.',
    image: 'assets/images/onboarding1.json',
  ),
  OnboardingPageModel(
    title: 'Stay Updated',
    description:
        'Get the latest news, updates, and recommendations to your tastes.',
    image: 'assets/images/onboarding2.json',
  ),
  OnboardingPageModel(
    title: 'Saerch and Discover ',
    description:
        'Explore a vast library of anime and manga with advanced search features.',
    image: 'assets/images/onboarding3.json',
  ),
];

class OnboardingView extends ConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController();
    final currentPage = ref.watch(currentPageProvider);

    Future<void> goToHome() async {
      // Mark onboarding as completed
      await ref
          .read(onboardingControllerProvider.notifier)
          .completeOnboarding();
      if (context.mounted) {
        GoRouter.of(context).go('/');
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          // Main content
          SafeArea(
            child: Column(
              children: [
                // Skip Button
                if (currentPage != onboardingPages.length - 1)
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: goToHome,
                      child: const Text('Skip'),
                    ),
                  )
                else
                  const SizedBox(
                    height: 48,
                  ), // Placeholder for consistent height
                // PageView for onboarding content
                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: onboardingPages.length,
                    onPageChanged: (index) {
                      ref.read(currentPageProvider.notifier).state = index;
                    },
                    itemBuilder: (_, index) {
                      return OnboardingPage(page: onboardingPages[index]);
                    },
                  ),
                ),

                // Bottom controls (indicators and next button)
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Page Indicators
                      Row(
                        children: List.generate(
                          onboardingPages.length,
                          (index) =>
                              PageIndicator(isActive: index == currentPage),
                        ),
                      ),

                      // Next/Get Started Button
                      ElevatedButton(
                        onPressed: () {
                          if (currentPage == onboardingPages.length - 1) {
                            goToHome();
                          } else {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(16),
                        ),
                        child: Icon(
                          currentPage == onboardingPages.length - 1
                              ? Icons.check
                              : Icons.arrow_forward_ios,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
