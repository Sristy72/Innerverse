import 'package:flutter/material.dart';
import 'package:flutter_khapree/core/common/widgets/app_scaffold.dart';
import 'package:get/get.dart';
import '../controller/onboarding_controller.dart';
import '../widgets/next__button.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/skip.dart';
import '../widgets/back_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return AppScaffold(
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            //Horizontal Scrollable pages
            PageView(
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
            //Dot navigation SmoothPageIndicator

            //Back button
            const OnBoardingBackButton(),

            //Skip button
            Positioned(
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 32),
                child: OnBoardingSkip(),
              ),
            ),

            //Circular Next button
            OnBoardingNextButton(),
          ],
        ),
      ),
    );
  }
}
