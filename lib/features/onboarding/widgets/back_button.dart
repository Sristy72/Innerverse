import 'package:flutter/material.dart';
import '../controller/onboarding_controller.dart';

class OnBoardingBackButton extends StatelessWidget {
  const OnBoardingBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 32,
      left: 0,
      child: IconButton(
        onPressed: () {
          OnboardingController.instance.previousPage();
        },
        icon: const Icon(Icons.arrow_back, color: Colors.white),
      ),
    );
  }
}
