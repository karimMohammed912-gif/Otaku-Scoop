import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:otaku_scope/features/onbardingFeature/widgets/onbarding_pages.dart';
import 'package:otaku_scope/features/onbardingFeature/widgets/page_indicator.dart';
import 'package:go_router/go_router.dart';
import 'package:otaku_scope/features/onbardingFeature/model/onbarding_model.dart';

final currentPageProvider = StateProvider<int>((ref) => 0);

final List<OnboardingPageModel> onboardingPages = [
  OnboardingPageModel(

    title: 'Welcome to Otaku Scope!',
    description:
        'Discover, track, and share your favorite anime and manga. All in one place.',
    image: 'assets/images/onboarding1.png',
  ),
  OnboardingPageModel(
    title: 'Stay Updated',
    description:
        'Get notifications for new episodes and trending series. Never miss a beat.',
    image: 'assets/images/onboarding2.png',
  ),
  OnboardingPageModel(
    title: 'Join the Community',
    description:
        'Connect with fellow fans, discuss your favorite shows, and share your reviews.',
    image: 'assets/images/onboarding3.png',
  ),
];

class OnboardingView extends ConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController();
    final currentPage = ref.watch(currentPageProvider);

    void goToHome() {
      GoRouter.of(context).go('/');
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
                  const SizedBox(height: 48), // Placeholder for consistent height

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
                          (index) => PageIndicator(
                            isActive: index == currentPage,
                          ),
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