import 'package:flutter/material.dart';
import 'package:flutter_khapree/core/common/widgets/app_scaffold.dart';
import 'package:get/get.dart';
import '../controller/onboarding_controller.dart';
import '../widgets/next__button.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return AppScaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //Horizontal Scrollable pages
            Positioned.fill(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.updatePageIndicator,
                children: [
                  OnBoardingPage(
                    image: 'assets/images/Frame 2147229491 (3).png',
                    title: 'Meditation & Somatic Practices',
                    subtitle:
                        'Release tension and find peace through guided practices',
                  ),

                  OnBoardingPage(
                    image: 'assets/images/Frame 2147229491 (1) (1).png',
                    title: 'Heal Through Journaling & Reflection',
                    subtitle:
                        'Process emotions and explore your shadow self with daily prompts',
                  ),

                  OnBoardingPage(
                    image: 'assets/images/Frame 2147229491 (2) (1).png',
                    title: 'Discover Your Inner Archetype',
                    subtitle:
                        'Understand your emotional patterns and personality through our guided quiz',
                  ),
                ],
              ),
            ),

            //Circular Next button
            OnBoardingNextButton(),

            //Back button - positioned last for proper hit testing
            Positioned(
              top: 0,
              left: 0,
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  onPressed: () {
                    print('Back button pressed'); // Debug print
                    controller.previousPage();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),

            //Skip button - positioned last for proper hit testing
            Positioned(
              top: 0,
              right: 0,
              child: Material(
                color: Colors.transparent,
                child: TextButton(
                  onPressed: () {
                    print('Skip button pressed'); // Debug print
                    controller.skipPage();
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
