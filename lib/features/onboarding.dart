import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:otaku_scope/features/top_anime/view/top_anime_view.dart';

// Provider to keep track of the current page index
final currentPageProvider = StateProvider<int>((ref) => 0);

class OnboardingPageModel {
  final String title;
  final String description;
  final IconData icon;

  OnboardingPageModel({
    required this.title,
    required this.description,
    required this.icon,
  });
}

final List<OnboardingPageModel> onboardingPages = [
  OnboardingPageModel(
    title: 'Welcome to Otaku Scope!',
    description:
        'Discover, track, and share your favorite anime and manga. All in one place.',
    icon: Icons.explore_outlined,
  ),
  OnboardingPageModel(
    title: 'Stay Updated',
    description:
        'Get notifications for new episodes and trending series. Never miss a beat.',
    icon: Icons.notifications_active_outlined,
  ),
  OnboardingPageModel(
    title: 'Join the Community',
    description:
        'Connect with fellow fans, discuss your favorite shows, and share your reviews.',
    icon: Icons.people_alt_outlined,
  ),
];

class OnboardingView extends ConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController();
    final currentPage = ref.watch(currentPageProvider);

    void goToHome() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const TopAnimeView()),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          // Background shapes
          const _BackgroundShapes(),

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
                      return _OnboardingPage(page: onboardingPages[index]);
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
                          (index) => _PageIndicator(
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

class _OnboardingPage extends StatelessWidget {
  final OnboardingPageModel page;

  const _OnboardingPage({required this.page});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            page.icon,
            size: 150,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 48),
          Text(
            page.title,
            style: textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            page.description,
            style: textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  final bool isActive;

  const _PageIndicator({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class _BackgroundShapes extends StatelessWidget {
  const _BackgroundShapes();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Positioned(
          top: -100,
          left: -100,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: -120,
          right: -150,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              color: colorScheme.secondary.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.4,
          right: -50,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: colorScheme.tertiary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
