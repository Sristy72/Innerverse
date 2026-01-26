import 'package:flutter/material.dart';

import '../controller/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        OnboardingController.instance.skipPage();
      },
      child: Text(
        'Skip',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
