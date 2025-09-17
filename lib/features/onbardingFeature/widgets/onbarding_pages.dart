import 'package:flutter/material.dart';
import 'package:otaku_scope/features/onbardingFeature/model/onbarding_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingPageModel page;

  const OnboardingPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(page.image, height: 300),
          const SizedBox(height: 48),
          Text(
            page.title,
            style: textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
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
